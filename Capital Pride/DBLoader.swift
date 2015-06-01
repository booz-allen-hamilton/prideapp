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
            loadJobs()
            loadPerformers()
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
        let exhibs: [[String]] = parseTabSeperated("Exhibitor", fileType: "txt", columns: 4)
        
        for ex in exhibs{
            let exhibitor: Exhibitor = svc.getNewEntityByType("Exhibitor") as! Exhibitor
            exhibitor.boothNumber = ex[0]
            exhibitor.companyName = ex[1]
            exhibitor.descriptionText = ex[2]
            exhibitor.website = ex[3]
        }
    }
    
    func loadJobs(){
        let jobs: [[String]] = parseTabSeperated("Jobs", fileType: "txt", columns: 4)
        
        for j in jobs {
            let job: Job = svc.getNewEntityByType("Job") as! Job
            job.field = j[0]
            job.fieldDescription = j[1]
            job.url = j[2]
            job.image = j[3]
        }
    }
    
    func loadPerformers(){
        let performers: [[String]] = parseTabSeperated("Performer", fileType: "txt", columns: 6)
        
        for p in performers {
            let performer: Performer = svc.getNewEntityByType("Performer") as! Performer
            performer.name = p[0]
            performer.image = p[1]
            performer.stage = p[2]
            performer.startTime = p[3]
            performer.bio = p[4]
            performer.facebook = p[5]
        }
    }
    
    
    func loadTechnologys(){
        let techs: [[String]] = parseTabSeperated("Technology", fileType: "txt", columns: 6)

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
    
    
    func parseTabSeperated(fileName: String, fileType: String, columns: Int) -> [[String]]{
        var array = [String]()
        var objs = [[String]]()
        var bad = [[String]]()
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: fileType)
        
        if let content = String(contentsOfFile:path!, encoding: NSUTF8StringEncoding, error: nil) {
            array = content.componentsSeparatedByString("--newline--\n")
        }
        
        for line in array{
            let row: [String] = split(line, allowEmptySlices: true, isSeparator: {$0 == "\t"})
            if row.count == columns {
                objs.append(row)
            }else{
                println("Bad line in " + fileName + " not added to DB: " + line)
            }
        }
        return objs
    }
    
    
}