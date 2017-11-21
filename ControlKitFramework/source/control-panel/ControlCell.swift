//
//  ControlCell.swift
//  ControlKit
//
//  Created by Alexander Bollbach on 11/21/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import UIKit 



class ControlCell: UICollectionViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.black.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    func getControlType(for param: Param) -> Control.Type {
        switch param.paramType {
        case .continuous:
            return ContinuousControl.self
        case .discrete:
            return DiscreteControl.self
        }
    }
    
    func configure(with param: Param) {
        
        let controlType = self.getControlType(for: param)
        
        let f = controlType.init(param: param)
        
        
        f.pinTo(superView: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        isUserInteractionEnabled = true
        
        addSubview(label)
        label.centerInSuper2(proportion: 0.6, superView: self)
        
        backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


