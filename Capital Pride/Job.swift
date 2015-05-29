//
//  Job.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

@objc(Job)
class Job: NSManagedObject {

    @NSManaged var field: String
    @NSManaged var fieldDescription: String
    @NSManaged var url: String
    @NSManaged var image: String

}
