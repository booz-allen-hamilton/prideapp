//
//  DBLoader.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/4/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class DBLoader: NSObject{
    
    let svc: DBService
    
    override init(){
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        svc = appDelegate.dbService!
    }
    
    func loadDB(){
        loadExhibitors()
        loadFoodAndDrinks()
        loadPerformances()
        loadInfo()
        svc.saveContext()
    }
    
    func loadExhibitors(){
        let ex1: Exhibitor = svc.getNewEntityByType("Exhibitor") as! Exhibitor
        ex1.boothNumber = "B24"
        ex1.companyName = "Booz Allen Hamilton"
        ex1.descriptionText = "Description Description Description Description Description Description"
        ex1.facebook = "fb.com/bah"
        ex1.pocName = "John Cloutier"
        ex1.twitter = "@boozallenhamilton"
        ex1.website = "http://www.bah.com"
    }
    
    func loadFoodAndDrinks(){
        
    }
    
    func loadPerformances(){
    
    }
    
    func loadInfo(){
        
    }
    
    
}