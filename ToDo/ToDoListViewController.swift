//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/9/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {
    
    let cacheKey = "CacheKey"
    let CellIdentifier = "CellIdentifier"
    @IBOutlet weak var tableView: UITableView?
 

    var items = NSMutableArray()
    var cache: CacheProtocol = UserDefaultsCache()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load and persisted data, if any exists
        //...
        self.load()
        
        self.title = "ToDo List"
        //in the last arg the colon designated there are parameters
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target:  self, action: "didTapAdd:")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier:  CellIdentifier)
      
    }
    
    //MARK:  AddItemViewControllerProtocol
    
    func addItem(item: String) {
        
        //Add the new item to the items array
        self.items.insertObject(item, atIndex: 0)
        
       // self.item.addOb(item)
        
        //mModify the tableview / lsitbview to dispaly the new item
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        //Save current data to disk
        self.save()
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            self.items.removeObjectAtIndex(indexPath.row)
            self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
            
            //Save data to disk
            self.save()
        }
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
        super.setEditing(editing, animated: animated)
        self.tableView?.setEditing(editing,animated: animated)
        self.navigationItem.rightBarButtonItem?.enabled = !editing
    }
    
    // MARK: Cache functions
   
    func load()
    {
        let object = self.cache.LoadObjectForkey(cacheKey)
        if let items   =  object as? NSArray{
            self.items = NSMutableArray(array: items)
        }
    }
    
    func save(){
        self.cache.saveObjecty(self.items, key: cacheKey)
    }
    
}
