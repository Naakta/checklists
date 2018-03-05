//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Doug Wagner on 2/7/18.
//  Copyright © 2018 Doug Wagner. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishAdding item: ChecklistItem)
    
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        // Unwrapping an optional - deciding what to do based
        // off of textField.text holding a value vs. nil
        /* if let textFieldString = textField.text
        {
          print("Contents of textField: \(textFieldString)")
        }
        else
        {
            print("textField contains no data")
        } */
        
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            
            delegate?.itemDetailViewController(self, didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem(text: textField.text!, checked: false)
//            item.text = textField.text! // force wrap because UI only allows strings to be pushed
//            item.checked = false
            
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never // revokes large title for this view
        
        // unwrapping the optional. If itemToEdit is not nil - this code will run
        // Only time it is not nil, is when this view is accessed through "+" 
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    // Do not select cells in this view
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // Causes textfield to be active immediately - enabling the keyboard
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        // string = the character being typed in
        // range is the location of the textfield/string where the character should be input
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)! // convert to swift Range
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        // Below can be rewritten to doneBarButton.isEnabled = !newText.isEmpty
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        
        return true
    }
    
}
