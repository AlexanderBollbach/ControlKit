//
//  ViewController.swift
//  TestControlKit
//
//  Created by Alexander Bollbach on 11/21/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import UIKit

import ControlKit

class StateController {
    
    var discreteProp: String = ""
    var continuousProp = 0.0
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
        let sc = StateController()
    
        let c1 = ControlKit.DiscreteParam { sc.discreteProp = $0 as! String }
        let c2 = ControlKit.ContinuousParam { sc.continuousProp = $0 as! Double }
        
        ControlKit.ControlPanel(with: [c1, c2]).pinTo(superView: self.view)
    }


}

