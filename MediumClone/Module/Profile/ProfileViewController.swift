//
//  ProfileViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 10/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let scrollView =  UIScrollView()
    let profileDetailView = ProfileDetailView()
    var topHeight : CGFloat = 0;
    var profileViewHeight : CGFloat = 0;
    var offSetGanGan:CGFloat = 0.0;
    var baseOffset : CGFloat = 0.0
    var statusBarHeight = UIApplication.shared.isStatusBarHidden ? CGFloat(0) : UIApplication.shared.statusBarFrame.height

    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        topHeight = calculateTopHeight()
        print( "======== stop scroling headerView at \(topHeight)")
        //ProfileDetail View
        profileDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = #colorLiteral(red: 0.9722703223, green: 0.9792027417, blue: 1, alpha: 1)

        
         //CollectionView
        let layoutParam = UICollectionViewFlowLayout.init()
        layoutParam.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: profileDetailView.frame.height, width: view.frame.width, height: view.frame.height - profileDetailView.frame.height), collectionViewLayout: layoutParam)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.autoresizesSubviews = true
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setUpViews(collectionView: collectionView)
    }
    
    
    func calculateTopHeight() ->CGFloat {
        let barHeight=self.navigationController?.navigationBar.frame.height ?? 0
        return barHeight + statusBarHeight
    }
    
    func setUpViews(collectionView : UICollectionView){
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = UIColor.white
        
        view.addSubview(profileDetailView)
        view.insertSubview(collectionView, belowSubview: profileDetailView)
        
        
        NSLayoutConstraint.activate([
            profileDetailView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileDetailView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            profileDetailView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
            ])
        
        profileViewHeight = profileDetailView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        print("===== Profile View height in setup views \(profileViewHeight)")
        offSetGanGan = profileViewHeight + topHeight;
        baseOffset = profileViewHeight + topHeight;
        
    }
    
}

extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        let profile = ProfileSectionCell(frame: CGRect(x: 0, y: 0, width: view.frame.height, height: view.frame.width), offset: offSetGanGan, baseOffset: baseOffset)
        
        profile.setProtocol(ourProtocol: self)
        profile.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(profile)

        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            profile.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            profile.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            profile.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor)
            ])

       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ProfileViewController:  TableOnScrollProtocol{
    func aboutToStartScrolling() {
        
    }
    
    func scrolling(point: CGFloat) {
        print( "======== scrolling point \(point)")
        let realPoint = -point
         offSetGanGan = -point
        //Add 32 (total profileView padding size to make it float)
        if(realPoint < profileViewHeight + topHeight + 32) {
             profileDetailView.frame = CGRect(x: 0, y: realPoint - topHeight - 32, width: profileDetailView.frame.width, height: profileDetailView.frame.height)
        }
    }
}


