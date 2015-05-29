//
//  JobViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class JobViewController: UITableViewController,  UISearchResultsUpdating{
    
    
    var baseBLO: BaseBLO?
    var jobs: [Job] = []
    
    var filteredTableData = [Job]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        jobs = baseBLO!.getAllJobs()
        jobs = sorted(jobs){ $0.field.lowercaseString < $1.field.lowercaseString }
        
        println(jobs.count)
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
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
            return jobs.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("jobCell") as! UITableViewCell
        if (self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            cell.textLabel?.text = filteredTableData[indexPath.row].field
            return cell
        }
        else {
            cell.textLabel?.text = jobs[indexPath.row].field
            return cell
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        if(searchController.searchBar.text != ""){
            filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchController.searchBar.text)
            let array = (jobs as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [Job]
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "JobDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? JobDetailController{
                let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
                destinationVC.job = jobs[indexPath.row]
            }
        }
    }
    

}
