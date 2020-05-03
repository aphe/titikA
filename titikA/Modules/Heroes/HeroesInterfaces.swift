//
//  HeroesInterfaces.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright (c) 2020 phe@work. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol HeroesWireframeInterface: WireframeInterface {
}

protocol HeroesViewInterface: ViewInterface {
    var collectionView: UICollectionView! { get }
}

protocol HeroesPresenterInterface: PresenterInterface {
    func update(with: [BaseModel])
    func numberOfItemsIn(section: Int) -> Int
    func cellForRowAt(index: IndexPath) -> UICollectionViewCell
    func didSelectRowAt(index: IndexPath)
}