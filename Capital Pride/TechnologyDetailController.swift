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
    @IBOutlet weak var url: UITextView!
    @IBOutlet weak var image: UIImageView!

    var technology: Technology?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        url.text = technology!.url
        pocEmail.text = technology!.pocEmail
        poc.text = technology!.poc
        techDescription.text = technology!.techDescription
        image.image = UIImage(named: technology!.image)
        self.title = technology!.name
    }
    
    override func viewDidLayoutSubviews() {
        techDescription.setContentOffset(CGPointZero, animated: false)
    }
    
}