//
//  Technology.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/20/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import Foundation
import CoreData

@objc(Technology)
class Technology: NSManagedObject{
    
    @NSManaged var image: String
    @NSManaged var name: String
    @NSManaged var poc: String
    @NSManaged var pocEmail: String
    @NSManaged var techDescription: String
    @NSManaged var url: String
    
}