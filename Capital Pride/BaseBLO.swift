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



    func getAllExhibitors() -> [Exhibitor]{
        return svc.getEntityList("Exhibitor") as! [Exhibitor]
    }
    
    func getAllFoodAndDrinks() -> [FoodAndDrink]{
        return svc.getEntityList("FoodAndDrink") as! [FoodAndDrink]
    }
    
    func getAllPerformances() -> [Performance]{
        return svc.getEntityList("Performance") as! [Performance]
    }
    
    func getAllInfos() -> [Info]{
        return svc.getEntityList("Info") as! [Info]
    }
    
}
