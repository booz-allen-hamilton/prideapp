//
//  DBService.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBService: NSObject {
    
    let managedObjectContext : NSManagedObjectContext?
    
    override init() {
        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }

    func getObjectById(objectId: NSManagedObjectID) -> NSManagedObject?{
        var error: NSError?
        var object = managedObjectContext?.existingObjectWithID(objectId, error: &error)
        return object
    }
    
    
    func getEntityList(type: String) -> NSArray{
        var error : NSError?
        let entityDescription = NSEntityDescription.entityForName("type", inManagedObjectContext: managedObjectContext!)
        let request = NSFetchRequest()
        request.entity = entityDescription
        var objects = managedObjectContext?.executeFetchRequest(request, error: &error)
        return objects!
    }

    func deleteObjectById(objectId: NSManagedObjectID){
        var error: NSError?
        if let object : NSManagedObject? = self.getObjectById(objectId){
            managedObjectContext?.deleteObject(object!)
        }
    }
    
    
    func getNewEntityByType(type: String!) -> NSManagedObject?{
        return NSEntityDescription.insertNewObjectForEntityForName(type, inManagedObjectContext: managedObjectContext!) as? NSManagedObject
    }

}