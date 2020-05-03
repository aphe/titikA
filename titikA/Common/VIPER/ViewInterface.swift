import UIKit

protocol ViewInterface: class {
    func showLoading()
    func hideLoading()
    func set(title: String)
}

extension ViewInterface {
    func showLoading() {}
    func hideLoading() {}
    func set(title: String) {}
}
