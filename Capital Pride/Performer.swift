//
//  Performer.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

@objc(Performer)
class Performer: NSManagedObject {

    @NSManaged var facebook: String
    @NSManaged var name: String
    @NSManaged var startTime: String
    @NSManaged var bio: String
    @NSManaged var stage: String
    @NSManaged var image: String

}
