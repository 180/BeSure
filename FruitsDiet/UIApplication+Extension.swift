//
//  UIApplication+Extension.swift
//  HeroesCompany
//
//  Created by Kamil Kuliński on 17.03.2016.
//  Copyright © 2016 Kamil Kuliński. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            
            if let selected = tab.selectedViewController {
                
                return topViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            
            return topViewController(presented)
        }
        
        return base
    }
    
    
}
