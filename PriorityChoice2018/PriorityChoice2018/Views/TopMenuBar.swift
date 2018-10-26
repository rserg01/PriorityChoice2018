//
//  TopMenuBar.swift
//  PriorityChoice2018
//
//  Created by Surge Sergio on 10/26/18.
//  Copyright © 2018 Surge. All rights reserved.
//

import UIKit

class TopMenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    let cellId = "cellId"
    let topMenuImages = ["Compass_Icon", "Products_Icon", "FinancialCalc_Icon", "PriorityChoice_Icon", "Profile_Icon"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(TopMenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TopMenuCell
        cell.iconView.image = UIImage(named: topMenuImages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 5, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TopMenuCell: BaseTopCell {
    
    let iconView : UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "Todo_Icon")
        return icon
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(iconView)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: iconView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: iconView)
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
