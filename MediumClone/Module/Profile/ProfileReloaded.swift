//
//  ProfileViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 10/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileReloaded: UIViewController {
    let profileDetailView = ProfileDetailView()
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //ProfileDetail View
        profileDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //CollectionView
        let layoutParam = UICollectionViewFlowLayout.init()
        layoutParam.scrollDirection = .horizontal
        layoutParam.headerReferenceSize.height = profileDetailView.frame.height
        layoutParam.headerReferenceSize.width = view.frame.width
        
       // layoutParam.headerReferenceSize = CGSize(width: view.frame.size.width, height: 100)

        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)!, width: view.frame.width, height: view.frame.height), collectionViewLayout: layoutParam)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        collectionView.autoresizesSubviews = true
        
        collectionView.register(ProfileDetailView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header")
        
        setUpViews(collectionView: collectionView)
    }
    
    func setUpViews(collectionView : UICollectionView){
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
            ])
        
    }
    
}

extension ProfileReloaded : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.green : UIColor.red
        
        let profile = ProfileSectionCell()
        profile.setProtocol(ourProtocol: self)
        profile.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(profile)
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)!),
            profile.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
            profile.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            profile.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor)
            ])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! ProfileDetailView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ProfileReloaded:  TableOnScrollProtocol{
    func aboutToStartScrolling() {
        
    }
    
    func scrolling(point: CGPoint) {
       // scrollView.setContentOffset(point, animated: true)
    }
}



