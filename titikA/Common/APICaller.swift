//
//  APICaller.swift
//  Mini StyleTheory
//
//  Created by Afriyandi Setiawan on 23/12/19.
//  Copyright © 2019 phe@work. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case unknownError
    case connectionError(err: Error)
    case invalidData(err: Error)
}

//TODO: - Add support for another HTTPMethod
struct APICaller {
    
    static let baseURL: String = "https://api.opendota.com"
    
    let urlPath:String
    
    typealias params = [String:Any]
    
    enum ApiResult<T> {
        case success(T)
        case failure(RequestError)
    }
    
    enum HTTPMethod: String {
        case get = "GET"
    }
        
    private func mapArray<T: Codable>(_ type: T.Type, data: Data, path: String? = nil) throws -> [T] {
        do {
            return try JSONDecoder().decode([T].self, from: try getJsonData(data, path: path))
        } catch {
            debugPrint(error)
            throw RequestError.invalidData(err: error)
        }
    }
    
    private func getJsonData(_ data: Data, path: String? = nil) throws -> Data {
        do {
            var jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            if let path = path {
                guard let specificObject = jsonObject.value(forKeyPath: path) else {
                    throw RequestError.unknownError
                }
                jsonObject = specificObject as AnyObject
            }
            return try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
        } catch {
            print(error)
            throw RequestError.invalidData(err: error)
        }
    }
    
    func fetch<C>(model: [C.Type], query: [String: String]? = nil, method: HTTPMethod = .get, apiPath: String? = nil, ignoreCache: Bool = false, result: @escaping (ApiResult<[C]>) -> Void) where C: Codable {
        var url = URL(string: APICaller.baseURL + urlPath)!
        if let query = query {
            let query = query.compactMap { (queries) -> URLQueryItem in
                return URLQueryItem(name: queries.key, value: queries.value)
            }
            var component = URLComponents(string: urlPath)!
            component.queryItems = query
            url = component.url ?? URL(string: urlPath)!
        }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = method.rawValue
        if let cache = CacheManager().fetch(from: url.absoluteString), !ignoreCache {
            let decoder = JSONDecoder()
            if let data = try? decoder.decode([C].self, from: cache) {
                result(ApiResult.success(data))
            }
        }
                        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                debugPrint(error)
                result(ApiResult.failure(.connectionError(err: error)))
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse else {
                result(ApiResult.failure(.unknownError))
                return
            }
            switch response.statusCode {
            case 200:
                guard let data = try? self.mapArray(C.self, data: data, path: apiPath) else {
                    result(ApiResult.failure(.unknownError))
                    return
                }
                let encoder = JSONEncoder()
                CacheManager().save(cache: try! encoder.encode(data), from: url.absoluteString)
                result(ApiResult.success(data))
            default:
                result(ApiResult.failure(.unknownError))
            }
        }.resume()
    }
    
}
