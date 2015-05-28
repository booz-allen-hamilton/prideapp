//
//  PerformanceDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class PerformanceDetailController: UIViewController {
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var facebook: UITextField!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var website: UITextView!

    
    var performance: Performance?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = performance!.name
        facebook.text = performance!.facebook
        website.text = performance!.website
        //startTime.text = performance?.startTime
        self.title = performance!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}