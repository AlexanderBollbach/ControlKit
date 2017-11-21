//
//  Slider.swift
//  SoundSketch
//
//  Created by Alexander Bollbach on 11/7/17.
//  Copyright © 2017 alexanderbollbach. All rights reserved.
//

import UIKit

class ContinuousControl: Control {
    
    
    override func configure() {
        
        let slider = Slider()
        slider.pinTo(superView: self)
        
        slider.updated = { value in
            self.updateParam(value: value)
        }
        
        backgroundColor = .red
        
        
    }
    
    
    
    required init(param: Param) {
        super.init(param: param)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Slider: UIControl {
    
    typealias ControlUpdated = (Any) -> Void
    
    var updated: ControlUpdated?
    
    let knobWidth: CGFloat = 20
    let bgLayer = CAShapeLayer()
    let knobLayer = CAShapeLayer()
    
    var value: Double = 0.0 {
        didSet {
            updated?(value)
            animateTo(level: value)
        }
    }
    
    var sliderStopped:(() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        configurePathForBGLayer()
        configurePathForKnobLayer(point: self.center)
        
        bgLayer.backgroundColor = UIColor.clear.cgColor
        knobLayer.backgroundColor = UIColor.white.withAlphaComponent(0.4).cgColor
        
        bgLayer.fillColor = UIColor.white.withAlphaComponent(0.3).cgColor
        knobLayer.fillColor = UIColor.white.withAlphaComponent(0.8).cgColor
        
        layer.addSublayer(bgLayer)
        
        // handle insetting knob
        let view = UIView()
        
        view.layer.addSublayer(knobLayer)
        
        
        
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor, constant: -(knobWidth / 2)).isActive = true
        view.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor, constant: knobWidth / 2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configurePathForBGLayer()
        configurePathForKnobLayer(point: self.center)
        
        animateTo(level: value)
    }
    
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        let pointX = touch.location(in: self).x
        
        //        animateKnob(to: pointX)
        
        sendActions(for: .valueChanged)
        
        value = Double(pointX / bounds.size.width)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        sliderStopped?()
    }
    
    
    private func animateTo(level: Double) {
        
        if level < 0 {
            print("tried to set slider to negative value??")
            return
        }
        
        let levelScaled = bounds.size.width * CGFloat(level)
        animateKnob(to: levelScaled)
    }
    
    func animateKnob(to location: CGFloat) {
        
        let ani = CABasicAnimation(keyPath: "position.x")
        ani.toValue = location
        ani.fillMode = kCAFillModeForwards
        ani.isRemovedOnCompletion = false
        knobLayer.add(ani, forKey: nil)
    }
    
    // MARK: configuration
    
    private func configurePathForBGLayer() {
        
        bgLayer.frame = bounds
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: 5)
        bgLayer.path = path.cgPath
    }
    
    private func configurePathForKnobLayer(point: CGPoint) {
        let knobRect = CGRect(x: 0, y: 0, width: knobWidth, height: bounds.size.height)
        knobLayer.frame = knobRect
        let path = UIBezierPath(roundedRect: knobRect, cornerRadius: 5)
        knobLayer.path = path.cgPath
    }
}
