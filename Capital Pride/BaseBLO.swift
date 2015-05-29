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
    
    func getAllJobs() -> [Job]{
        return svc.getEntityList("Job") as! [Job]
    }
    
    func getAllPerformers() -> [Performer]{
        return svc.getEntityList("Performer") as! [Performer]
    }
    
    func getAllInfos() -> [Info]{
        return svc.getEntityList("Info") as! [Info]
    }
    
    func getAllTechnologys() -> [Technology]{
        return svc.getEntityList("Technology") as! [Technology]
    }
    
}
