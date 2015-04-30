//
//  FoodAndDrink.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

class FoodAndDrink: NSManagedObject {

    @NSManaged var boothNumber: String
    @NSManaged var closeTime: NSTimeInterval
    @NSManaged var cuisine: String
    @NSManaged var name: String
    @NSManaged var openTime: NSTimeInterval
    @NSManaged var location: NSManagedObject

}
