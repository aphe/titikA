//
//  CacheManager.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import SQLite
import Foundation

struct CacheManager {
    
    private let storage = "\(FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!)cache.sqlite3"
    private var connection:Connection?
    private let cacheTable = Table("cache")
    private let id = Expression<Int64>("id")
    private let url = Expression<String>("url")
    private let data = Expression<Data>("data")

    
    init() {
        do {
            self.connection = try Connection(storage)
            try connection?.run(cacheTable.create(ifNotExists: true) { t in
                t.column(url, primaryKey: true)
                t.column(data)
            })
        } catch let err {
            debugPrint(err)
        }
    }
        
    func save(cache: Data, from urlStr: String) {
        do {
            try connection?.run(cacheTable.insert(url <- urlStr, data <- cache))
        } catch let err {
            debugPrint(err)
        }
    }
    
    func fetch(from urlStr: String) -> Data? {
        let query = cacheTable.filter(url == urlStr).limit(1)
        do {
            for cache in try connection!.prepare(query) {
                return cache[data]
            }
        } catch let err {
            debugPrint(err)
            return nil
        }
        return nil
    }
    
}
