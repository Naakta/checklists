//
//  Checklist.swift
//  Checklists
//
//  Created by Doug Wagner on 2/26/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No Icon"
    // var items = [ChecklistItem]() // Sugar syntax
    // OR - var items: [ChecklistItem] = []
    var items: [ChecklistItem] = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items {  // could have been shortened to "for item in items where !item.checked {}"
            if item.checked == false {
                count += 1
            }
        }
        return count
    }
}
