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

    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        
        //ProfileDetail View
        profileDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        
         //CollectionView
        let layoutParam = UICollectionViewFlowLayout.init()
        layoutParam.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: profileDetailView.frame.height, width: view.frame.width, height: view.frame.height - profileDetailView.frame.height), collectionViewLayout: layoutParam)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProfileSectionCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        
        setUpViews(collectionView: collectionView)
    }
    
    func setUpViews(collectionView : UICollectionView){
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        scrollView.addSubview(profileDetailView)
        scrollView.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
            profileDetailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileDetailView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            profileDetailView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: profileDetailView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
            ])
        
    }
    
}

extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ProfileSectionCell
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.green : UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


