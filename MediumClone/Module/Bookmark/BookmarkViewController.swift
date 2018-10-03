//
//  BookmarkViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 02/10/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    let cellId : String = "wideCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        let customHeaderView = BookmarkHeaderView()
        let tableView = UITableView()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240.0
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "WideStoryViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor, constant: 64).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive  = true

        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        customHeaderView.backgroundColor = .purple
        customHeaderView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        customHeaderView.autoresizingMask = []
        
        tableView.tableHeaderView = customHeaderView
        
      
    }
    
}



extension BookmarkViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! WideStoryViewCell
        return cell
    }
}

class BookmarkHeaderView : UIView {
    
    let label : UILabel = {
        let headerLable = UILabel()
        headerLable.text = "Become a Medim member to read your saved stories offline"
        headerLable.translatesAutoresizingMaskIntoConstraints = false
        headerLable.textColor = UIColor.lightGray
        headerLable.numberOfLines = 0
        headerLable.textAlignment = .center
        headerLable.lineBreakMode = .byWordWrapping
        return headerLable
        
    }()
    
    let upgradeButton : UIButton = {
        let button : UIButton = UIButton()
        button.setTitle("Upgrade", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        return button
    }()
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews(){
        self.addSubview(label)
        self.addSubview(upgradeButton)
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-16-[v1]-20-|", options: .directionMask, metrics: nil, views: ["v0":label,"v1":upgradeButton])
        NSLayoutConstraint.activate(constraints)
        
        let Hconstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: .alignAllCenterX, metrics: nil, views: ["v0":label])
        NSLayoutConstraint.activate(Hconstraints)
        
        upgradeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        upgradeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

