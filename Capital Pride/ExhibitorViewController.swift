//
//  ExhibitorViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class ExhibitorViewController: UITableViewController, UISearchResultsUpdating{
    
    var baseBLO: BaseBLO?
    var exhibitors: [Exhibitor] = []
    
    var filteredTableData = [Exhibitor]()
    var resultSearchController = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        exhibitors = baseBLO!.getAllExhibitors()
        exhibitors = sorted(exhibitors){ $0.companyName.lowercaseString < $1.companyName.lowercaseString }
        
        println(exhibitors.count)
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "rainbow-header")!.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch), forBarMetrics: .Default)
        //self.navigationController?.navigationBar.translucent = false
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.active) {
            return self.filteredTableData.count
        }
        else {
            return exhibitors.count
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("exhibitorCell") as! UITableViewCell
        if (self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            cell.textLabel?.text = filteredTableData[indexPath.row].companyName
            return cell
        }
        else {
            cell.textLabel?.text = exhibitors[indexPath.row].companyName
            return cell
        }
    }

    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        if (searchController.searchBar.text != "") {
            filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF.companyName CONTAINS[c] %@", searchController.searchBar.text)
            let array = (exhibitors as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [Exhibitor]
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ExhibitorDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? ExhibitorDetailController{
                let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
                if(self.resultSearchController.active){
                    destinationVC.exhibitor = filteredTableData[indexPath.row]
                }else{
                    destinationVC.exhibitor = exhibitors[indexPath.row]
                }
                resultSearchController.active = false
            }
        }
    }
    
}

