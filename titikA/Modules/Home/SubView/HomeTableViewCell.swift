//
//  HomeTableViewCell.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var roleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(text: String) -> Self {
        roleLabel.text = text
        return self
    }
    
}
