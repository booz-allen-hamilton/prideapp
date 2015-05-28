//
//  FoodAndDrinkDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class FoodAndDrinkDetailController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var boothNumber: UITextField!
    @IBOutlet weak var openTime: UITextField!
    @IBOutlet weak var cuisine: UITextView!
    
    var foodAndDrink: FoodAndDrink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = foodAndDrink!.name
        boothNumber.text = foodAndDrink!.boothNumber
        //openTime.text = foodAndDrink!.openTime
        cuisine.text = foodAndDrink!.cuisine
        self.title = foodAndDrink!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}