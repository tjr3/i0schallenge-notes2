//
//  EntryController.swift
//  Notes
//
//  Created by Tyler on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    private let kEntry = "sharedController"
    
    static let sharedController = EntryController()
    
    var entryArray: [Entry] = []
    
    init () {
        loadFromPersistentStorage()
    }
    
    // CRUD
    
    func addEntry(entry: Entry) {
        entryArray.append(entry)
        saveToPersistentStorage()
        
    }
    
    func deleteEntry(entry: Entry) {
        if let entry = entryArray.indexOf(entry) {
        entryArray.removeAtIndex(entry)
            saveToPersistentStorage()
        }
        
    }

    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(entryArray.map{$0.dictionaryCopy}, forKey: kEntry)
    
    }
    
    func loadFromPersistentStorage() {
        guard let entryDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(kEntry) as? [[String:AnyObject]] else { return
        }
        self.entryArray = entryDictionaryArray.flatMap{Entry(dictionary: $0)}
        
        
    }


}