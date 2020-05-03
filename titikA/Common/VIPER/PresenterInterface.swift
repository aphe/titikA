import UIKit

protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

extension PresenterInterface {

    func viewDidLoad() {
        fatalError("Implementation pending...")
    }

    func viewWillAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }

    func viewDidAppear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }

    func viewWillDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }

    func viewDidDisappear(_ animated: Bool) {
        fatalError("Implementation pending...")
    }

}
