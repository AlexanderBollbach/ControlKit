import UIKit



extension UIView {
    
    func pinTo(superView: UIView, insetBy insets: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: insets).isActive = true
        self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -insets).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -insets).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: insets).isActive = true
        
    }
    
    
    func pinTo(superView: UIView) {
        
        superView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        
    }
    
    func pinTo(superView: UIView, inset: CGFloat) {
        
        superView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: inset).isActive = true
        self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -inset).isActive = true
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: inset).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -inset).isActive = true
        
    }
    
    func sizeInSuper(proportion: CGFloat, superView: UIView) {
        
        //        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: proportion).isActive = true
        self.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: proportion).isActive = true
        
    }
    
    func centerInSuper2(proportion: CGFloat, superView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: proportion).isActive = true
        self.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: proportion).isActive = true
        
    }
}
