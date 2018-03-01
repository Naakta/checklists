//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Doug Wagner on 2/6/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text: String = ""
    var checked: Bool = false
    
    func toggleChecked() {
        checked = !checked
    }
}


