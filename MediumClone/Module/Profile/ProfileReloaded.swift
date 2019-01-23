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
    let scrollView = UIScrollView();
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //ProfileDetail View
        profileDetailView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let swipeGestureRecognize = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeGestureRecognize.direction  = .up
        
//        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(handleS))
//        swipeGestureRecognizerDown.direction  = .down
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        
        self.view.addGestureRecognizer(swipeGestureRecognize)
        self.view.addGestureRecognizer(panGesture)
        
        
        //CollectionView
        let layoutParam = UICollectionViewFlowLayout.init()
        layoutParam.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layoutParam)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.autoresizesSubviews = true
         collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
//        collectionView.register(ProfileDetailView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header")
        
        setUpViews(collectionView: collectionView)
    }
    
    
    @objc func handleSwipe(){
      print("siped up")
     // scrollView.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
      
    }
    
    @objc func handlePan(sender:UIPanGestureRecognizer){
        print("pan")
        let translation = sender.translation(in: self.view)
        //let location =  sender.location(in: self.view)
        print(translation.y)
        scrollView.contentOffset = CGPoint(x: 0, y: -translation.y)
    }
    
    func setUpViews(collectionView : UICollectionView){
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(profileDetailView)
        scrollView.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor), scrollView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height + profileDetailView.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

extension ProfileReloaded:  TableOnScrollProtocol{
    func aboutToStartScrolling() {
        
    }
    
    func scrolling(point: CGFloat) {
       // scrollView.setContentOffset(point, animated: true)
    }
}



