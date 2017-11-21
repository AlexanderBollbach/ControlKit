//
//  Parameters.swift
//  ControlKit
//
//  Created by Alexander Bollbach on 11/21/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import Foundation



// PARAMS

public class Param {
    
    public enum ParamType {
        case continuous
        case discrete
    }
    
    public init(paramType: ParamType, listener: @escaping ParamListener) {
        self.paramType = paramType
        self.listener = listener
    }
    
    public typealias ParamListener = (Any) -> Void
    
    public var paramType: ParamType = .continuous
    
    public var listener: ParamListener?
    
    public func updateParam(value: Any) { listener?(value) }
}

public class ContinuousParam: Param {
    
    public init(listener: @escaping ParamListener) {
        super.init(paramType: .continuous, listener: listener)
    }
}

public class DiscreteParam: Param {
    
    public init(listener: @escaping ParamListener) {
        super.init(paramType: .discrete, listener: listener)
    }
}

