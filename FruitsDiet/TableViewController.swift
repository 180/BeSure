//
//  TableViewController.swift
//  FruitsDiet
//
//  Created by Maciej Stanik on 22/04/16.
//  Copyright © 2016 Maciej Stanik. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellIdentifier = "listCell"
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK:- prepareForSegue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let categoryNumber = tableView.indexPathForSelectedRow?.row {
            let viewController = segue.destinationViewController as! ViewController
            viewController.category = categoryNumber
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.groups.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ListCell
        
        cell.listNameLabel.text = dataSource.gettGroupLabelAtIndex(indexPath.row)
        cell.timeLabel.text = "dziś 9:30"
        
        return cell
    }

}
