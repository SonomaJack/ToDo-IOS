//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Jack Bretcher on 2/9/16.
//  Copyright © 2016 Sonoma Enterprises. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?

    var items = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ToDo List"
        //in the last arg the colon designated there are parameters
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target:  self, action: "didTapAdd:")
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier:  "CellIdentifier")
        
        self.items.addObject("Jack")
        self.items.addObject("Jill")
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        print("Edit")
    }
    //MARK:  UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")!
        
        let item = self.items[indexPath.row] as! String
        cell.textLabel?.text = item
        return cell
    }
    
    
    //MARK:Actions
    
    func didTapAdd(sender: UIBarButtonItem){
        print ("Add")
        
    }
    
}
