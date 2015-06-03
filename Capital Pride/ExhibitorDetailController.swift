//
//  ExhibitorDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class ExhibitorDetailController: UIViewController {
    
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var website: UITextView!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    var exhibitor: Exhibitor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //location.text = exhibitor!.boothNumber
        companyName.text = exhibitor!.companyName
        descriptionText.text = exhibitor!.descriptionText
        website.text = exhibitor!.website
        image.image = UIImage(named: exhibitor!.image)
        self.title = exhibitor!.companyName
    }
    
    override func viewDidLayoutSubviews() {
        descriptionText.setContentOffset(CGPointZero, animated: false)
    }
    
}