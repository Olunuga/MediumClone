//
//  ProfileViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 10/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let tableView =  UITableView()
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ProfileDetailCell.self, forCellReuseIdentifier: "profileDetailCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        //        tableView.separatorColor = UIColor(white: 0.5, alpha: 0.3)
        
        setUpViews()
    }
    
    func setUpViews(){
        
        view.backgroundColor = UIColor.white
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
            ])
        
    }
    
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let otherCell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell
        
        let profileDetailCell =  tableView.dequeueReusableCell(withIdentifier: "profileDetailCell", for: indexPath) as! ProfileDetailCell
        
        
        return indexPath.row == 0 ? profileDetailCell : otherCell
    }
}
