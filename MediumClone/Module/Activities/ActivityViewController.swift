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
    
    let imgUser = UIImageView()
    let labUerName = UILabel()
    let labMessage = UILabel()
    let labTime = UILabel()
    
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
              // contentSection.setHasContent(true)
               let label = UILabel()
        
                label.text = "Somebody followed you"
        
                label.translatesAutoresizingMaskIntoConstraints = false
                profileView.translatesAutoresizingMaskIntoConstraints = false
                contentSection.translatesAutoresizingMaskIntoConstraints = false
        
                //contentView.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(profileView)
                contentView.addSubview(contentSection)
        
        
                NSLayoutConstraint.activate([
                    profileView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
                    profileView.leftAnchor.constraint(equalTo:  contentView.safeAreaLayoutGuide.leftAnchor, constant: 16),
                    contentSection.leftAnchor.constraint(equalTo: profileView.rightAnchor, constant: 16),
                    contentSection.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: 16),
                    contentSection.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
                    contentSection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
                    contentSection.heightAnchor.constraint(equalToConstant: 100)
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
        image.image = UIImage(named: "star")
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
        
        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]|", options: .alignAllCenterX, metrics: nil,  views: ["v0" : profileImage])
        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(20)]|", options: .alignAllCenterX, metrics: nil,  views: ["v0" : profileImage])
        
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            floatingIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
            floatingIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 4)
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
         label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let content : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "make this a bit cleaner, this is meant to be a long text that spans down the lane"
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
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "star")
        return image
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
            userLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            userLabel.heightAnchor.constraint(equalToConstant: 12),
            
            action.leftAnchor.constraint(equalTo: userLabel.rightAnchor, constant: 5),
            action.topAnchor.constraint(equalTo: self.topAnchor),
            action.heightAnchor.constraint(equalToConstant: 12),
            
            content.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: userLabel.bottomAnchor, multiplier: 1),
            content.leftAnchor.constraint(equalTo: self.leftAnchor),
            content.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            date.leftAnchor.constraint(equalTo: self.leftAnchor),
            date.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: content.bottomAnchor, multiplier: 1),
            date.rightAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: self.rightAnchor, multiplier: 16),
            date.heightAnchor.constraint(equalToConstant: 12)
            ])
    }
    
   
}
