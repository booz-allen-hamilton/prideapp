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

    func getAllExhibitors() -> Array<Int>{
        svc.getEntityList("@Exhibitor")
        return [Int]()
    }
    
    func saveExhibitor(ex: Exhibitor){
        let exhibitor: Exhibitor = svc.getNewEntityByType("@Exhibitor") as! Exhibitor
        exhibitor.boothNumber = ex.boothNumber
        exhibitor.companyName = ex.companyName
        exhibitor.descriptionText = ex.descriptionText
        exhibitor.facebook = ex.facebook
        exhibitor.pocName = ex.pocName
        exhibitor.twitter = ex.twitter
        exhibitor.website = ex.website
        exhibitor.location = ex.location
    }
    
}
