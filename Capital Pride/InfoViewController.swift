//
//  InfoViewController.swift
//  Capital Pride
//
//  Created by John Cloutier on 4/23/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var whatwedo: UIButton!
    @IBOutlet weak var diversity: UIButton!
    @IBOutlet weak var careers: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "rainbow-header")!.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch), forBarMetrics: .Default)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func linkClicked(sender: UIButton) {

        let label: String = sender.titleLabel!.text!
        switch label {
            
            case "WHAT WE DO":
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.boozallen.com/consulting")!)
            case "CAREERS":
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.boozallen.com/careers")!)
            case "DIVERSITY":
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.boozallen.com/about/diversity-inclusion")!)
            default:
                println("Unrecognized button: " + sender.titleLabel!.text!)
                UIApplication.sharedApplication().openURL(NSURL(string: "http://boozallen.com")!)
        }
        

        
        
    }
    

    
}

