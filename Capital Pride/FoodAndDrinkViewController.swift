//
//  FoodAndDrinkViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class FoodAndDrinkViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let foodAndDrinks = ["Beer","Wine","Vodka","Gin"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodAndDrinks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("foodAndDrinkCell") as! UITableViewCell
        
        cell.textLabel!.text = foodAndDrinks[indexPath.row]
        
        return cell
    }
}
