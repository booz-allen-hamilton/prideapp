//
//  PerformerDetailController.swift
//  Capital Pride
//
//  Created by John Cloutier on 5/11/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class PerformerDetailController: UIViewController {
    

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var facebook: UITextView!
    @IBOutlet weak var startTime: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bio: UITextView!
    
    var performer: Performer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = performer!.name
        facebook.text = performer!.facebook
        startTime.text = performer?.startTime
        image.image = UIImage(named: performer!.image)
        self.title = performer!.name
    }
    
    override func viewDidLayoutSubviews() {
        bio.setContentOffset(CGPointZero, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
}