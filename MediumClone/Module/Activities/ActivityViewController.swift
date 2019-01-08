//
//  ActivityViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 05/11/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit


class ActivityViewController: UIViewController{
    @IBOutlet weak var navBar: UINavigationBar!
    
    let activityCell = ActivityCell()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        
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
    
}


extension ActivityViewController : UITableViewDelegate, UITableViewDataSource {
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityCell
        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}



class ActivityCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView()  {
               let profileView = ProfileContainer()
               let contentSection = ContentSection()
        
                 let containerView = UIView();
    
                 containerView.translatesAutoresizingMaskIntoConstraints = false
                 profileView.translatesAutoresizingMaskIntoConstraints = false
                 contentSection.translatesAutoresizingMaskIntoConstraints = false
        
        
               contentView.addSubview(containerView)
               containerView.addSubview(profileView)
               containerView.addSubview(contentSection)
        
    
                NSLayoutConstraint.activate([
                    containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant : 16),
                    containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor , constant : -16),
                    containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant : -16),
                    containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant : 16),
                    
                    contentSection.topAnchor.constraint(equalTo: containerView.topAnchor),
                    contentSection.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                    contentSection.leftAnchor.constraint(equalTo: profileView.rightAnchor, constant: 8),
                    contentSection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                    
                    profileView.topAnchor.constraint(equalTo: containerView.topAnchor),
                    profileView.leftAnchor.constraint(equalTo:  containerView.leftAnchor),
                    ])
    }
}



class ProfileContainer : UIView {
    
    let profileImage : UIImageView  = {
        let image = UIImageView()
        image.image = UIImage(named: "woman")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let floatingIcon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "circle")
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews(){
        self.addSubview(profileImage)
        self.addSubview(floatingIcon)
        
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(30)]|", options: .alignAllCenterX, metrics: nil,  views: ["v0" : profileImage])
        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(30)]|", options: .alignAllCenterX, metrics: nil,  views: ["v0" : profileImage])
        
        NSLayoutConstraint.activate([
            floatingIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2),
            floatingIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 2)
            ])
        
    
        NSLayoutConstraint.activate(verticalConstraint)
        NSLayoutConstraint.activate(horizontalConstraint)
        
       
    }
}



class ContentSection : UIView {
    var hasContent : Bool = false
    
    let userLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bern Sterlin"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let action : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "clapped for"
        label.textColor = UIColor.gray
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let content : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "make this a bit cleaner, this is a long long long omgn one tme stuff"
        return label
    }()
    
    let date : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.gray
        label.text = "28 May"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHasContent(_ yes : Bool){
        self.hasContent = yes
    }
    
    
    
    func setupViews(){
        self.addSubview(userLabel)
        self.addSubview(action)
        self.addSubview(content)
        self.addSubview(date)
        
        
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: self.topAnchor),
            userLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            action.topAnchor.constraint(equalTo: self.topAnchor),
            action.leadingAnchor.constraint(equalTo: userLabel.trailingAnchor, constant : 5),
            
            content.topAnchor.constraint(equalTo: userLabel.bottomAnchor,  constant: 5),
            content.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            date.topAnchor.constraint(equalTo: content.bottomAnchor, constant: 5),
            date.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            date.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            date.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    
    }
    
   
}
