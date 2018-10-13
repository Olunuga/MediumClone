//
//  BookmarkViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 02/10/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    let cellId : String = "wideCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        let customHeaderView = BookmarkHeaderView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 130))
        let tableView = UITableView()
        
        tableView.estimatedRowHeight = 240.0
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor(white: 0.5, alpha: 0.3)
        tableView.register(UINib(nibName: "WideStoryViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        customHeaderView.backgroundColor = UIColor(red: 241/255, green: 247/255, blue: 237/255, alpha: 1)
        customHeaderView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        customHeaderView.autoresizingMask = []
        
        tableView.tableHeaderView = customHeaderView
        view.addSubview(tableView)
        
        let bottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        
        //Set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive  = true
    }
    
}



extension BookmarkViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! WideStoryViewCell
        cell.selectionStyle = .none
        cell.actionMenuWidthConstraint.constant = 0
        cell.bookmarkButtonTrailingContraint.constant = 5
        return cell
    }
}

class BookmarkHeaderView : UIView {
    let label : UILabel = {
        let headerLable = UILabel()
        headerLable.text = "Become a Medium member to read your saved stories offline"
        headerLable.translatesAutoresizingMaskIntoConstraints = false
        headerLable.textColor = UIColor.darkGray
        headerLable.numberOfLines = 0
        headerLable.textAlignment = .left
        headerLable.lineBreakMode = .byWordWrapping
        headerLable.font = UIFont.systemFont(ofSize: 14, weight: .semibold)//UIFont(name: "HelveticaNeue-Thin", size: 14)
        return headerLable
        
    }()
    
    let upgradeButton : UIButton = {
        let button : UIButton = UIButton()
        button.setTitle("Upgrade", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 5
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
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-16-[v1(40)]-20-|", options: .directionMask, metrics: nil, views: ["v0":label,"v1":upgradeButton])
        NSLayoutConstraint.activate(constraints)
        
        let Hconstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(250)]", options: .alignAllCenterX, metrics: nil, views: ["v0":label])
        NSLayoutConstraint.activate(Hconstraints)
        
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        upgradeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        upgradeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
