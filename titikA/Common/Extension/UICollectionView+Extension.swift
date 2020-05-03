//
//  UICollectionView+Extension.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell<T>(_ cell: T.Type, identifier: String? = nil) where T: UICollectionViewCell {
        let nib = UINib(nibName: String(describing: cell.self), bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier == nil ? String(describing: cell.self) : identifier!)
    }
    
    func dequeueCell<T>(_ cell: T.Type, indexPath: IndexPath, identifier: String? = nil) -> T where T: UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier == nil ? String(describing: cell.self) : identifier!, for: indexPath)
        guard let vcell = cell as? T else { fatalError() }
        return vcell
    }
}
