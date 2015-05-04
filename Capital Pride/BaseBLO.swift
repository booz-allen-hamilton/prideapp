//
//  BaseBLO.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/4/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class BaseBLO: NSObject{
    let svc: DBService
    
    override init(){
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        svc = appDelegate.dbService!
    }


    //MARK: Exhibitor functions

    func getAllExhibitors() -> [Exhibitor]{
        return svc.getEntityList("Exhibitor") as! [Exhibitor]
    }
    
    func saveExhibitor(ex: Exhibitor){
        let exhibitor: Exhibitor = svc.getNewEntityByType("Exhibitor") as! Exhibitor
        exhibitor.boothNumber = ex.boothNumber
        exhibitor.companyName = ex.companyName
        exhibitor.descriptionText = ex.descriptionText
        exhibitor.facebook = ex.facebook
        exhibitor.pocName = ex.pocName
        exhibitor.twitter = ex.twitter
        exhibitor.website = ex.website
        exhibitor.location = ex.location
    }

    //MARK: Food And Drink functions
    
    func getAllFoodAndDrinks() -> [FoodAndDrink]{
        return svc.getEntityList("FoodAndDrink") as! [FoodAndDrink]
    }
    
    func saveFoodAndDrink(fnd: FoodAndDrink){
        let foodAndDrink: FoodAndDrink = svc.getNewEntityByType("FoodAndDrink") as! FoodAndDrink
        foodAndDrink.boothNumber = fnd.boothNumber
        foodAndDrink.closeTime = fnd.closeTime
        foodAndDrink.cuisine = fnd.cuisine
        foodAndDrink.name = fnd.name
        foodAndDrink.openTime = fnd.openTime
        foodAndDrink.location = fnd.location
    }
    
    //MARK: Performance functions
    
    func getAllPerformances() -> [Performance]{
        return svc.getEntityList("Performance") as! [Performance]
    }
    
    func savePerformance(p: Performance){
        let performance: Performance = svc.getNewEntityByType("Performance") as! Performance
        performance.facebook = p.facebook
        performance.name = p.name
        performance.startTime = p.startTime
        performance.stopTime = p.stopTime
        performance.twitter = p.twitter
        performance.website = p.website
    }
    
    //MARK: Info functions
    
    func getAllInfos() -> [Info]{
        return svc.getEntityList("Info") as! [Info]
    }
    
    func saveInfo(i: Info){
        let info: Info = svc.getNewEntityByType("Info") as! Info
        info.text = i.text
    }
}
