//
//  UIColor+Extension.swift
//  HeroesCompany
//
//  Created by Kamil Kuliński on 08.03.2016.
//  Copyright © 2016 Kamil Kuliński. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    struct App {
        
        static let profileLightColor = UIColor(hex: "18AFC1")
        static let profileDarkColor = UIColor(hex: "000028")
        static let profileGrayColor = UIColor(hex: "A8A8A8")
        
        static let redAccentColor = UIColor(red:1, green:0.3, blue:0.3, alpha:1)
        static let blueAccentColor = UIColor(red:0.04, green:0.74, blue:0.8, alpha:1)

        static let hostColor = UIColor(red:1, green:0.3, blue:0.3, alpha:1)
        static let heroColor = UIColor(red:0.04, green:0.74, blue:0.8, alpha:1)
        
        static let timePickerSelectionStrokeColor = UIColor.whiteColor()
        static let timePickerStrokeColor = UIColor(hex: "FFA7A7")
        
        static let buttonEnable = UIColor(hex: "47C6D1")
        static let buttonDisable = UIColor(hex: "A9A9A9")
    }
    
    public convenience init(hex: String) {
        
        guard var   hexValue:  UInt32 = 0
            where NSScanner(string: hex).scanHexInt(&hexValue) else {
                
                self.init()
                return
        }
        
        let divisor = CGFloat(255)
        let red     = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hexValue & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hexValue & 0x0000FF       ) / divisor
        
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(1))
    }
    
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(Double(arc4random() % 256) / 256.0) // 0.0 to 1.0
        let saturation = CGFloat(Double(arc4random() % 128) / 266.0 + 0.5) // 0.5 to 1.0, away from white
        let brightness = CGFloat(Double(arc4random() % 128) / 256.0 + 0.5) // 0.5 to 1.0, away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
}
