//
//  HeroesCollectionViewCell.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import UIKit

class HeroesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        heroImage.image = UIImage()
    }
    
    func setup(data: BaseModel?) -> Self {
        guard let data = data else {
            return self
        }
        heroImage.loadImage(fromURL: APICaller.baseURL + (data.img ?? "/apps/dota2/images/heroes/drow_ranger_full.png"))
        heroNameLabel.text = data.localizedName
        switch data.primaryAttr {
        case "agi":
            heroNameLabel.textColor = UIColor(0x1eae27)
        case "str":
            heroNameLabel.textColor = UIColor(0xd83a08)
        case "int":
            heroNameLabel.textColor = UIColor(0x06cbde)
        default:
            heroNameLabel.textColor = UIColor(0x4a4a4a)
        }
        return self
    }

}
