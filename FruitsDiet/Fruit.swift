//
//  Fruit.swift
//  FruitsDiet
//
//  Created by Ravi Shankar on 30/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class Fruit {
    var name:String?
    var group:String?
    var checked:Bool?
    var image:UIImage?
    
    init(name: String, group: String, checked: Bool) {
        self.name = name
        self.group = group
        self.checked = checked
    }
    
    init(name: String, checked: Bool, image: UIImage) {
        self.name = name
        self.image = image
        self.checked = checked
    }
}