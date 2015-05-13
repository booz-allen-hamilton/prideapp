//
//  ExhibitorViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class ExhibitorViewController: UITableViewController {
    
    var baseBLO: BaseBLO?
    var exhibitors: [Exhibitor] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        exhibitors = baseBLO!.getAllExhibitors()
        exhibitors = sorted(exhibitors){ $0.companyName.lowercaseString < $1.companyName.lowercaseString }
        
        println(exhibitors.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("exhibitorCell") as! UITableViewCell
        
        cell.textLabel!.text = exhibitors[indexPath.row].companyName
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ExhibitorDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? ExhibitorDetailController{
                let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
                destinationVC.exhibitor = exhibitors[indexPath.row]
            }
        }
    }
    
}

