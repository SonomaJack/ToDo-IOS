//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/23/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import UIKit

protocol AddItemViewControllerProtocol {
    func addItem(item: String)
}

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    //Add this line of code to you can link the text field to this variable in teh XIB file
    
    @IBOutlet  weak var textField: UITextField?
    
    var delegate:  AddItemViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Add Item"
        
        //moves teh top edge below the nav bar
        self.edgesForExtendedLayout=UIRectEdge.None
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target:  self, action: "didTapCancel:")
        
        //Sets focus to teh text box so teh keyboard shows
        self.textField?.becomeFirstResponder()
        
        self.textField?.delegate = self
        

        // Do any additional setup after loading the view.
        //self.view.backgroundColor = UIColor.grayColor()
    }
    
    //MARK:  UITextFieldDelegate 
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        
        self.dismissViewControllerAnimated(true) { () -> Void in
            if let delegate = self.delegate, let item = textField.text where textField.text?.characters.count > 0 {
                delegate.addItem(item)
            }
        }
        
      //  ToDoListViewController.tableView(<#T##ToDoListViewController#>)

        return true
    }

    func didTapCancel(sender: UIBarButtonItem){
        self.dismissViewControllerAnimated(true,completion:  nil)
    }
   
}
