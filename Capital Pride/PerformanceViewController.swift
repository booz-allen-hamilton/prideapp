//
//  PerformanceViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class PerformanceViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let performances = ["Cher","Madonna","Bette","Beyonce"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return performances.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("performanceCell") as! UITableViewCell
        
        cell.textLabel!.text = performances[indexPath.row]
        
        return cell
    }
}

