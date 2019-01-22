//
//  ProfileSectionViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 13/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileSectionCell : UIView{
    let tableView =  UITableView()
     let profileDetailView = ProfileDetailView()
    var tableOnScroll: TableOnScrollProtocol? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ProfileDetailCell.self, forCellReuseIdentifier: "profileDetailCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        tableView.isScrollEnabled = false
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setUpViews(){
        
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.purple
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "hello"
        
        self.backgroundColor = UIColor.purple
        self.addSubview(containerView)
        containerView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            ])
        
    }
    
    func setProtocol(ourProtocol: TableOnScrollProtocol){
        self.tableOnScroll = ourProtocol
    }
}

extension ProfileSectionCell : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let otherCell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell

        return otherCell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableOnScroll?.aboutToStartScrolling()
        print("I want to scroll")
    }
   
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        tableOnScroll?.scrolling(point: scrollView.contentOffset)
//        print("i am scrolling \(scrollView.contentOffset)")
//    }

}

protocol TableOnScrollProtocol {
    func aboutToStartScrolling()
    func scrolling(point : CGPoint)
    
}
