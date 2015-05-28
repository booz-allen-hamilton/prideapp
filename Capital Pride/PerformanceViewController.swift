//
//  PerformanceViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class PerformanceViewController: UITableViewController, UISearchResultsUpdating {
    
    var performances: [Performance] = []
    var filteredTableData = [Performance]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active) {
            return self.filteredTableData.count
        }
        else {
            return performances.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("performanceCell") as! UITableViewCell
        if (self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            cell.textLabel?.text = filteredTableData[indexPath.row].name
            return cell
        }
        else {
            cell.textLabel?.text = performances[indexPath.row].name
            return cell
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        if (searchController.searchBar.text != ""){
            filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchController.searchBar.text)
            let array = (performances as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [Performance]
            self.tableView.reloadData()
        }
    }
}

