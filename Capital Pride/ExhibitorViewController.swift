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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        baseBLO = BaseBLO()
        let exhibitors: Array<Exhibitor> = baseBLO!.getAllExhibitors()
        
        println(exhibitors.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let exhibitors = ["Booz Allen Hamilton","Human Rights Campaign","No Cover DC","Haliburton"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitors.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("exhibitorCell") as! UITableViewCell
        
        cell.textLabel!.text = exhibitors[indexPath.row]
        
        return cell
    }
    
}

