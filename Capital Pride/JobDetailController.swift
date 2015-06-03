//
//  FoodAndDrinkDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class JobDetailController: UIViewController {

    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var fieldDescription: UITextView!
    @IBOutlet weak var url: UITextView!
    
    var job: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.text = job!.field
        fieldDescription.text = job!.fieldDescription
        url.text = job!.url
        self.title = job!.field
    }
    
    override func viewDidLayoutSubviews() {
        fieldDescription.setContentOffset(CGPointZero, animated: false)
    }
    
}