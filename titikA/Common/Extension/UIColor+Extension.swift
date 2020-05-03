//
//  UIColor+Extension.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(_ hex: UInt) {
      self.init(
          red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
          green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
          blue: CGFloat(hex & 0x0000FF) / 255.0,
          alpha: CGFloat(1.0)
      )
  }
}
