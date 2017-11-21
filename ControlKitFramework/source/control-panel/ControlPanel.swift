//
//  ControlPanel.swift
//  ControlKit
//
//  Created by Alexander Bollbach on 11/21/17.
//  Copyright © 2017 Alexander Bollbach. All rights reserved.
//

import UIKit 

public class ControlPanel: UIView, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    let layout = UICollectionViewFlowLayout()
    let collectionView: UICollectionView
    
    let params: [Param]
    
    public init(with params: [Param]) {
        
        self.params = params
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(frame: .zero)
        
        collectionView.pinTo(superView: self)
        
        collectionView.register(ControlCell.self, forCellWithReuseIdentifier: "controlCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureCollectionViewLayout()
        
    }
    
    private func configureCollectionViewLayout() {
        
        let w = collectionView.bounds.size.width
        let h = collectionView.bounds.size.height
        
        let inset = collectionView.bounds.size.width * 0.03
        
        layout.itemSize = CGSize(width:  w / 3,height: h)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = inset
        layout.minimumLineSpacing = inset
        collectionView.isPagingEnabled = false
        collectionView.isScrollEnabled = true
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = bounds
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return params.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "controlCell", for: indexPath) as! ControlCell
        cell.configure(with: params[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width / 4, height: collectionView.bounds.size.height)
    }
    
    
}
