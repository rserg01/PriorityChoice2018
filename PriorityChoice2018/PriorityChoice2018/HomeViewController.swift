//
//  ViewController.swift
//  PriorityChoice2018
//
//  Created by Surge Sergio on 10/18/18.
//  Copyright © 2018 Surge. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MainMenuCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    class MainMenuCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        let thumbnailView : UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = UIColor.blue
            return imageView
        }()
        
        let separatorView : UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black
            return view
        }()
        
        let titleText : UILabel = {
            let textView = UILabel()
            textView.backgroundColor = UIColor.purple
            return textView
        }()
        
        func setupViews() {
            addSubview(thumbnailView)
            addSubview(titleText)
            addSubview(separatorView)
            
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailView)
            addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleText)
            
            //vertical constraints
            addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(34)]-16-[v2(1)]|", views: thumbnailView,titleText, separatorView)
            addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
            
            //top constraint
            addConstraint(NSLayoutConstraint(item: titleText, attribute: .top, relatedBy: .equal, toItem: thumbnailView, attribute: .bottom, multiplier: 1, constant: 8))
            //left constraint
            //addConstraint(NSLayoutConstraint(item: titleText, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
            //right constraint
            //addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
            //height constraint
            addConstraint(NSLayoutConstraint(item: titleText, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}

extension UIView {
    func addConstraintsWithFormat(format : String, views : UIView...) {
        
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewsDictionary))
    }
}

