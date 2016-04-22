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
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([ .Hour, .Minute, .Second], fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        
        cell.timeLabel.text = "Dziś \(hour):\(minutes-indexPath.row*2)"
        
        cell.statusIconImageView.hidden = (NSInteger(indexPath.row/2) == 0 ) ? true : false
        
        return cell
    }

}
