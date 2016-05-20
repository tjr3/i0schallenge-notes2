//
//  Entry.swift
//  Notes
//
//  Created by Tyler on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Entry : Equatable {
    
    private let kTitle = "title"
    private let kBodyText = "bodyText"
    private let kTimeStamp = "timeStamp"
    
    
    var title: String
    var bodyText: String
    let timeStamp: NSDate
    
    
    var dictionaryCopy: [String:AnyObject] {
        return [kTitle: title, kBodyText: bodyText, kTimeStamp: timeStamp]
    }
    
    init(title: String, bodyText: String, timeStamp: NSDate) {
        
        self.title = title
        self.bodyText = title
        self.timeStamp = timeStamp
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
        bodyText = dictionary[kBodyText] as? String,
        timeStamp = dictionary[kTimeStamp] as? NSDate else { return nil }
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
    
    
    
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timeStamp == rhs.timeStamp
}