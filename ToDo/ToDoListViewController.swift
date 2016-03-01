//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/9/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {
    
    let CellIdentifier = "CellIdentifier"
    @IBOutlet weak var tableView: UITableView?
 

    var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ToDo List"
        //in the last arg the colon designated there are parameters
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target:  self, action: "didTapAdd:")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier:  CellIdentifier)
      
    }
    
    //MARK:  AddItemViewControllerPrpotocol
    
    func addItem(item: String) {
        
        //Add the new item to the items array
        self.items.insertObject(item, atIndex: 0)
        
       // self.item.addOb(item)
        
        //mModify the tableview / lsitbview to dispaly the new item
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
    }
   
    //MARK:  UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier)!
        
        let item = self.items[indexPath.row] as! String
        cell.textLabel?.text = item
        return cell
    }
    
    
    //MARK:Actions
    
    func didTapAdd(sender: UIBarButtonItem){
        
        let viewController = AddItemViewController()
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor=UIColor.whiteColor()
        self.presentViewController(navigationController, animated: true, completion: nil)
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        print("Edit")
    }
    
}
