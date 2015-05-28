//
//  TechnologyDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class TechnologyDetailController: UIViewController {
   

    @IBOutlet weak var poc: UITextField!
    @IBOutlet weak var pocEmail: UITextField!
    @IBOutlet weak var techDescription: UITextView!
    @IBOutlet weak var url: UITextField!

    var technology: Technology?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        url.text = technology!.url
        pocEmail.text = technology!.pocEmail
        poc.text = technology!.poc
        self.title = technology!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}