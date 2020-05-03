//
//  HeroDetailWireframe.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright (c) 2020 phe@work. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HeroDetailWireframe: BaseWireframe {

    // MARK: - Module setup -

    init() {
        let moduleViewController = HeroDetailViewController()
        super.init(viewController: moduleViewController)
        
        let presenter = HeroDetailPresenter(view: moduleViewController, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HeroDetailWireframe: HeroDetailWireframeInterface {
}
