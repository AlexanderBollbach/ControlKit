//
//  ToggleControl.swift
//  ControlsView
//
//  Created by Alexander Bollbach on 11/20/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import UIKit

class DiscreteControl: Control {
    
    var currentToggle = false {
        didSet {
            if currentToggle {
                backgroundColor = .blue
            } else {
                backgroundColor = .green
            }
        }
    }
    
    override func configure() {
        
        
        backgroundColor = .blue
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tap)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(param: Param) {
        super.init(param: param)
        
        configure()
    }
    
    @objc func tapped() {
        
        currentToggle = !currentToggle
        
        self.updateParam(value: currentToggle)
        
    }
}
