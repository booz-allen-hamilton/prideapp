//
//  Exhibitor.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

@objc(Exhibitor)
class Exhibitor: NSManagedObject{

    @NSManaged var boothNumber: String
    @NSManaged var companyName: String
    @NSManaged var descriptionText: String
    @NSManaged var facebook: String
    @NSManaged var pocName: String
    @NSManaged var twitter: String
    @NSManaged var website: String
    @NSManaged var location: NSManagedObject

}
