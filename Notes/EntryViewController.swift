//
//  EntryViewController.swift
//  Notes
//
//  Created by Tyler on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var entryDetailView: UITextView!
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            updateEntry(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action Buttons 
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let entry = entry {
            entry.title = titleTextField.text ?? ""
            entry.bodyText = entryDetailView.text ?? ""
        } else {
            let entry = Entry(title: titleTextField.text ?? "", bodyText: entryDetailView.text ?? "", timeStamp: NSDate())
            EntryController.sharedController.addEntry(entry)
            self.entry = entry
            
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    
    func updateEntry(entry: Entry) {
        self.navigationItem.title = entry.title
        entryDetailView.text = entry.bodyText
        titleTextField.text = entry.title
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
