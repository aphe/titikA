//
//  Array+Extension.swift
//  titikA
//
//  Created by Afriyandi Setiawan on 03/05/20.
//  Copyright © 2020 phe@work. All rights reserved.
//

import Foundation

extension Array where Element : Equatable {
    
    public mutating func mergeElements<C : Collection>(newElements: C) where C.Iterator.Element == Element{
        let filteredList = newElements.filter { (e) -> Bool in
            !self.contains(e)
        }
        self.append(contentsOf: filteredList)
    }
    
}
