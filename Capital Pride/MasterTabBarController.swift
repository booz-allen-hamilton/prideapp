//
//  MasterTabBarController.swift
//  Capital Pride
//
//  Created by John Cloutier on 6/1/15.
//  Copyright (c) 2015 John Cloutier. All rights reserved.
//

import Foundation
import UIKit

class MasterTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.backgroundImage = UIImage(named: "flag")!.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch)
    }
    
}