//
//  Control.swift
//  ControlKit
//
//  Created by Alexander Bollbach on 11/21/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import UIKit 

class Control: UIView {
    
    var param: Param
    
    required init(param: Param) {
        
        self.param = param
        
        super.init(frame: .zero)
    }
    
    func configure() {
        // override
    }
    
    func updateParam(value: Any) {
        
        param.updateParam(value: value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
