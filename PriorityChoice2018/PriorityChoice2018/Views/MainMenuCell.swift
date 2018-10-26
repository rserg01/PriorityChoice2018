//
//  MainMenuCell.swift
//  PriorityChoice2018
//
//  Created by Surge Sergio on 10/25/18.
//  Copyright © 2018 Surge. All rights reserved.
//

import UIKit

class BaseTopCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MainMenuCell: BaseTopCell {
    
    
    let thumbnailView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "ProfileManager_Menu_Image")
        return imageView
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let titleText : UILabel = {
        let textView = UILabel()
        textView.backgroundColor = UIColor.darkGray
        textView.textColor = UIColor.white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.text = " Menu Name"
        return textView
    }()
    
    override func setupViews() {
        addSubview(thumbnailView)
        addSubview(titleText)
        addSubview(separatorView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleText)
        
        //vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1]-16-[v2(1)]|", views: thumbnailView,titleText, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleText, attribute: .top, relatedBy: .equal, toItem: thumbnailView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleText, attribute: .left, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleText, attribute: .right, relatedBy: .equal, toItem: thumbnailView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: titleText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 50))
        
    }
}
