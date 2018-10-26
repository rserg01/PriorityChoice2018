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
        
        //navigationItem.title = "Home"
        navigationController?.navigationBar.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        //navigationController?.navigationBar.isTranslucent = false
        
        //get rid of black bar underneath navigationbar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font.withSize(20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(MainMenuCell.self, forCellWithReuseIdentifier: "cell")
        
        //to push down the collectionview from the menubar
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
    }
    
    let menubar : TopMenuBar = {
        let mb = TopMenuBar()
        return mb
    }()
    
    private func setupMenuBar(){
        self.view.addSubview(menubar)
        self.view.addConstraintsWithFormat(format: "H:|[v0]|", views: menubar)
        self.view.addConstraintsWithFormat(format: "V:|-60-[v0(50)]|", views: menubar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    

}



