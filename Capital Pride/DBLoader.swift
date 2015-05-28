//
//  DBLoader.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/4/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBLoader: NSObject{
    
    let svc: DBService
    
    override init(){
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        svc = appDelegate.dbService!
    }
    
    func loadDB(){
        if dbEmpty(){
            loadExhibitors()
            loadFoodAndDrinks()
            loadPerformances()
            loadTechnologys()
            loadInfo()
            svc.saveContext()
        }
    }
    
    func dbEmpty() -> Bool{
        let list: [NSManagedObject] = svc.getEntityList("Exhibitor")!
        
        if list.count == 0 {
            return true
        }else{
            return false
        }
    }
    
    func loadExhibitors(){
        let exhibs: [[String]] = parseCSV()
        
        for ex in exhibs{
            let exhibitor: Exhibitor = svc.getNewEntityByType("Exhibitor") as! Exhibitor
            exhibitor.boothNumber = ex[0]
            exhibitor.companyName = ex[1]
            exhibitor.descriptionText = ex[2]
            exhibitor.website = ex[3]
            exhibitor.facebook = ex[4]
            exhibitor.pocName = "John Cloutier"
            exhibitor.twitter = ex[5]
        }
    }
    
    func loadFoodAndDrinks(){
        let foodAndDrink: FoodAndDrink = svc.getNewEntityByType("FoodAndDrink") as! FoodAndDrink
        foodAndDrink.boothNumber = "B45"
        foodAndDrink.closeTime = NSTimeInterval()
        foodAndDrink.cuisine = "Drinks"
        foodAndDrink.name = "Beer 'n More"
        foodAndDrink.openTime = NSTimeInterval()
    }
    
    func loadPerformances(){
        let performance: Performance = svc.getNewEntityByType("Performance") as! Performance
        performance.facebook = "fb.com/cher"
        performance.name = "Cher"
        performance.startTime = NSTimeInterval()
        performance.stopTime = NSTimeInterval()
        performance.twitter = "@cher"
        performance.website = "http://www.cher.com"
    }
    
    
    func loadTechnologys(){
        let techs: [[String]] = parseTabSeperated("Technologies", fileType: "txt", columns: 6)

        for t in techs {
            let technology: Technology = svc.getNewEntityByType("Technology") as! Technology
            technology.image = t[0]
            technology.name = t[1]
            technology.poc = t[2]
            technology.pocEmail = t[3]
            technology.techDescription = t[4]
            technology.url = t[5]
        }
    }
    
    func loadInfo(){
        let info: Info = svc.getNewEntityByType("Info") as! Info
        info.text = "Here's some info Here's some info Here's some info Here's some info Here's some info"
    }
    
    func parseCSV() -> [[String]]{
        var array = [String]()
        var exhibs = [[String]]()
        var bad = [[String]]()
        let path = NSBundle.mainBundle().pathForResource("FestivalExhibitors2015", ofType: "txt")
        
        if let content = String(contentsOfFile:path!, encoding: NSUTF8StringEncoding, error: nil) {
            array = content.componentsSeparatedByString("\n")
        }
        
        for line in array{
            let row: [String] = split(line, allowEmptySlices: true, isSeparator: {$0 == "\t"})
            if row.count == 7 {
                exhibs.append(row)
            }else{
                println("Bad line not added to DB: " + line)
            }
        }
        return exhibs
    }
    
    func parseTabSeperated(fileName: String, fileType: String, columns: Int) -> [[String]]{
        var array = [String]()
        var objs = [[String]]()
        var bad = [[String]]()
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        
        if let content = String(contentsOfFile:path!, encoding: NSUTF8StringEncoding, error: nil) {
            array = content.componentsSeparatedByString("\n")
        }
        
        for line in array{
            let row: [String] = split(line, allowEmptySlices: true, isSeparator: {$0 == "\t"})
            if row.count == columns {
                objs.append(row)
            }else{
                println("Bad line not added to DB: " + line)
            }
        }
        return objs
    }
    
    
}