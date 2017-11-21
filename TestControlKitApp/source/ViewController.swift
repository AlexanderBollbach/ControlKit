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
    
    var discreteProp: Bool = false
    var continuousProp = 0.0
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
        let sc = StateController()
    
        let c1 = ControlKit.DiscreteParam { sc.discreteProp = $0 as! Bool }
        let c2 = ControlKit.ContinuousParam { sc.continuousProp = $0 as! Double }
        
        let c3 = ControlKit.DiscreteParam { sc.discreteProp = $0 as! Bool }
        let c4 = ControlKit.ContinuousParam { sc.continuousProp = $0 as! Double }
        
        ControlKit.ControlPanel(with: [c1, c2, c3, c4]).pinTo(superView: self.view)
    }


}

