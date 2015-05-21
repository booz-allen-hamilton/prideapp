//
//  BahDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class BahDetailController: UIViewController {
    
  //  @IBOutlet weak var companyName: UITextField!
  //  @IBOutlet weak var website: UITextField!
  //  @IBOutlet weak var location: UITextField!
  //  @IBOutlet weak var descriptionText: UITextView!
    
        var bah: BAH?
    
/*    @NSManaged var image: String
    @NSManaged var name: String
    @NSManaged var location: UITextField
    @NSManaged var poc: String
    @NSManaged var pocEmail: String
    @NSManaged var techDescription: String
    @NSManaged var pocEMail: String
    @NSManaged var url: String
 */
    var bahs: BAH?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     location.text = exhibitor!.boothNumber
     //   companyName.text = exhibitor!.companyName
     //   descriptionText.text = exhibitor!.descriptionText
     //   website.text = exhibitor!.website
        self.title = bahs!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}