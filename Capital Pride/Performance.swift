//
//  Performance.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

@objc(Performance)
class Performance: NSManagedObject {

    @NSManaged var facebook: String
    @NSManaged var name: String
    @NSManaged var startTime: NSTimeInterval
    @NSManaged var stopTime: NSTimeInterval
    @NSManaged var twitter: String
    @NSManaged var website: String

}
