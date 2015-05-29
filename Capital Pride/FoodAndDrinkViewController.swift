//
//  FoodAndDrinkViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class FoodAndDrinkViewController: UITableViewController,  UISearchResultsUpdating{
    
    
    var baseBLO: BaseBLO?
    var foodAndDrinks: [FoodAndDrink] = []
    
    var filteredTableData = [FoodAndDrink]()
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        foodAndDrinks = baseBLO!.getAllFoodAndDrinks()
        foodAndDrinks = sorted(foodAndDrinks){ $0.name.lowercaseString < $1.name.lowercaseString }
        
        println(foodAndDrinks.count)
        
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
            return foodAndDrinks.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("foodAndDrinkCell") as! UITableViewCell
        if (self.resultSearchController.active && resultSearchController.searchBar.text != "") {
            cell.textLabel?.text = filteredTableData[indexPath.row].name
            return cell
        }
        else {
            cell.textLabel?.text = foodAndDrinks[indexPath.row].name
            return cell
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        if(searchController.searchBar.text != ""){
            filteredTableData.removeAll(keepCapacity: false)
            let searchPredicate = NSPredicate(format: "SELF.name CONTAINS[c] %@", searchController.searchBar.text)
            let array = (foodAndDrinks as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [FoodAndDrink]
            self.tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FoodAndDrinkDetailSegue"
        {
            if let destinationVC = segue.destinationViewController as? FoodAndDrinkDetailController{
                let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
                destinationVC.foodAndDrink = foodAndDrinks[indexPath.row]
            }
        }
    }
    

}
