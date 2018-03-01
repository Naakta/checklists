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
    // var items = [ChecklistItem]() // Sugar syntax
    // OR - var items: [ChecklistItem] = []
    var items: [ChecklistItem] = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
