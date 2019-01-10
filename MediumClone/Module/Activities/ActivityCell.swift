//
//  ActivityCell.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 09/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ActivityCell : UITableViewCell {
    let profileView = ProfileContainer()
    let contentSection = ContentSection()
    let followSection = FollowButtonSection()
    let containerView = UIView()
    
    var delegate : FollowButtonPressedDelegate? =  nil
    var cellIndex = -1
    var tempFollowTag = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpClicks()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(delegate : FollowButtonPressedDelegate){
        self.delegate = delegate
    }
    
    func setIndex(index : Int){
        cellIndex = index
    }
    
    
    @objc func handleContentTap (sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // handling code
            if (delegate != nil) {
                delegate?.followButtonPressed(index: cellIndex)
                tempFollowTag = !tempFollowTag
                let name = tempFollowTag ? "followed":"unfollowed"
                (followSection.subviews[0] as! UIImageView).image = UIImage(named: name)
            }
        }
    }
    
    
    func setUpClicks(){
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.handleContentTap(sender:)))
        
        let followIcon = followSection.subviews[0]
        followIcon.isUserInteractionEnabled = true
        followIcon.addGestureRecognizer(tap)
    }
    
    func setUpView()  {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileView.translatesAutoresizingMaskIntoConstraints = false
        contentSection.translatesAutoresizingMaskIntoConstraints = false
        followSection.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        containerView.addSubview(profileView)
        containerView.addSubview(contentSection)
        containerView.addSubview(followSection)
        
        followSection.backgroundColor  = UIColor.white
        contentSection.backgroundColor = UIColor.white
        
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant : 16),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor , constant : -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant : -16),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant : 16),
            
            contentSection.topAnchor.constraint(equalTo: containerView.topAnchor),
            contentSection.trailingAnchor.constraint(equalTo: followSection.leadingAnchor),
            contentSection.leftAnchor.constraint(equalTo: profileView.rightAnchor, constant: 8),
            contentSection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            profileView.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileView.leftAnchor.constraint(equalTo:  containerView.leftAnchor),
            
            
            followSection.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            followSection.topAnchor.constraint(equalTo: containerView.topAnchor),
            followSection.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            followSection.widthAnchor.constraint(equalToConstant: 60)
            ])
    }
}


class FollowButtonSection : UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        let followIcon : UIImageView  = {
            let image = UIImageView()
            image.image = UIImage(named: "unfollowed")
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        
        self.addSubview(followIcon)
        NSLayoutConstraint.activate([
            followIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            followIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            followIcon.heightAnchor.constraint(equalToConstant: 24),
            followIcon.widthAnchor.constraint(equalToConstant: 24)
            ])
        
    }
}



class ProfileContainer : UIView {
    
    let profileImage : UIImageView  = {
        let imageView = UIImageView()
        let image = UIImage(named: "profileimage")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
