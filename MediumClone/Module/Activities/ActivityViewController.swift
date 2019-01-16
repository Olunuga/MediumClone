//
//  ActivityViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 05/11/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

protocol FollowButtonPressedDelegate {
    func followButtonPressed(index: Int)
}

class ActivityViewController: UIViewController, FollowButtonPressedDelegate {
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    let activityCell = ActivityCell()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "Activities"
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor(white: 0.5, alpha: 0.3)
        
        view.addSubview(tableView)
        
        let bottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive  = true
    }
    
    
    
    func followButtonPressed(index: Int) {
        //TODO: Make network call to follow or unfollow user here and change the button appropiately
        print("follow button for row \(index) was clicked")
    }
    
    func rowPressed(index: Int) {
        //TODO: open user profile or content
        print("Row \(index) was clicked")
        let profileViewController = ProfileReloaded()
        self.navigationController?.pushViewController(profileViewController, animated: true)
        
    }
    
}


extension ActivityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell
        cell.setDelegate(delegate: self)
        cell.setIndex(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       rowPressed(index: indexPath.row)
    }
    
}
