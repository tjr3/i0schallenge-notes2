//
//  TimeFormat.swift
//  Notes
//
//  Created by Tyler on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


extension NSDate {
    func dateFormat() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
       return dateFormatter.stringFromDate(self)
    }
    
}