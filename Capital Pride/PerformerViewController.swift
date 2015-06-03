//
//  PerformerViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class PerformerViewController: UITableViewController, UISearchResultsUpdating {
    
    var baseBLO: BaseBLO?
    var performers: [Performer] = []
    
    var filteredTableData = [Performer]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        performers = baseBLO!.getAllPerformers()
        performers = sorted(performers){ $0.name.lowercaseString < $1.name.lowercaseString }
        
        println(performers.count)
        
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
            return performers.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("performerCell") as! UITableViewCell
        if (self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            cell.textLabel?.text = filteredTableData[indexPath.row].name
            return cell
        }
        else {
            cell.textLabel?.text = performers[indexPath.row].name
            return cell
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        if (searchController.searchBar.text != ""){
            filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchController.searchBar.text)
            let array = (performers as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [Performer]
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PerformerDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? PerformerDetailController{
                let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
                if(self.resultSearchController.active){
                    destinationVC.performer = filteredTableData[indexPath.row]
                }else{
                    destinationVC.performer = performers[indexPath.row]
                }
                
                resultSearchController.active = false
            }
        }
    }
}

