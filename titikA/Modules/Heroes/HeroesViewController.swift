//
//  HeroesViewController.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright (c) 2020 phe@work. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HeroesViewController: UIViewController {

    // MARK: - Public properties -

    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: HeroesPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension HeroesViewController: HeroesViewInterface {
    func set(title: String) {
        self.title = title
    }
}

extension HeroesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsIn(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.cellForRowAt(index: indexPath)
    }
    
}
