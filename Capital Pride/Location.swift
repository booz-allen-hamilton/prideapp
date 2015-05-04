//
//  Location.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/27/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import CoreData

@objc(Location)
class Location: NSManagedObject {

    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var exhibitor: Exhibitor
    @NSManaged var foodAndDrink: FoodAndDrink

}
