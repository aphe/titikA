//
//  SimpleLayout.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import UIKit

class SimpleLayout: UICollectionViewFlowLayout {
    
    private var firstTimer = false
    
    override func prepare() {
        super.prepare()
        if !firstTimer {
            setup()
            firstTimer = true
        }
    }
    
    func setup() {
        scrollDirection = .vertical
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        itemSize = CGSize(width: collectionView!.frame.width / 2, height: collectionView!.frame.width / 2)
        collectionView!.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}
