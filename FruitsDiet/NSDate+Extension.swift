//
//  NSDate+Extension.swift
//  FruitsDiet
//
//  Created by Kamil Kuliński on 22.04.2016.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import Foundation

extension NSDate {
    func dateStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
}