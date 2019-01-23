//
//  ProfileDetailView.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 13/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileDetailView: UICollectionReusableView{
    
     let debug = false;
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        let rightColumn = UIView()
        let leftColumn = UIView()
        let mainView = UIView();
        
        let followerBox = UIView()
        let count : UILabel = {
            let label = UILabel()
            label.text = "5.81k"
            label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let desc : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Following"
            label.textColor = UIColor.gray
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()
        
        let profileImage : UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(named: "profileimage")
            imageView.layer.cornerRadius = 30
            imageView.clipsToBounds = true
            imageView.layer.masksToBounds = true
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        
        
        let profileDec = UIView()
        profileDec.translatesAutoresizingMaskIntoConstraints = false
        profileDec.backgroundColor = debug ? UIColor.purple : UIColor.white
        let profileName : UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.text = "John Cousins"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let dateJoined : UILabel = {
            let label = UILabel()
            label.textColor =  UIColor.init(red: 3/255, green: 168/255, blue: 124/255, alpha: 1.0)
            label.font = UIFont.systemFont(ofSize: 13)
            label.text = "Member since july 2018"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let about : UILabel = {
            let label = UILabel()
            label.text = "Distilling business ideas. I write down my thoughts so others can understand my logic and help improve it. Get free biz books http://eepurl.com/b8UzpL"
            label.numberOfLines = 0
            label.textAlignment = .justified
            label.font = UIFont.systemFont(ofSize: 13)
            label.lineBreakMode = .byWordWrapping
            label.textColor = UIColor.gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
//        Distilling business ideas. I write down my thoughts so others can understand my logic and help improve it. Get free biz books http://eepurl.com/b8UzpL
        
        
        
        followerBox.addSubview(count)
        followerBox.addSubview(desc)
        
        rightColumn.translatesAutoresizingMaskIntoConstraints = false
        rightColumn.backgroundColor = debug ? UIColor.yellow : UIColor.white
        
        leftColumn.translatesAutoresizingMaskIntoConstraints = false
        leftColumn.backgroundColor =  debug ? UIColor.green : UIColor.white
        
        mainView.translatesAutoresizingMaskIntoConstraints = false;
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        followerBox.translatesAutoresizingMaskIntoConstraints = false
        followerBox.backgroundColor = debug ? UIColor.red : UIColor.white
        
        
        
        self.addSubview(mainView)
        
        let mainTop = mainView.topAnchor.constraint(equalTo: self.topAnchor)
        mainTop.identifier = "main top"
        let mainTrailing = mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        mainTrailing.identifier = "main trailing"
        
        let mainBottom = mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        mainBottom.identifier = "main bootom"
        
        let mainLeading = mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        mainLeading.identifier = "main leading"
        
        mainView.addSubview(rightColumn)
        mainView.addSubview(leftColumn)
        
        rightColumn.addSubview(profileDec)
        
        profileDec.addSubview(profileName)
        profileDec.addSubview(dateJoined)
        profileDec.addSubview(about)
        
        leftColumn.addSubview(profileImage)
        leftColumn.addSubview(followerBox)
        
        
        
        let bottomBlock = UIView();
        bottomBlock.translatesAutoresizingMaskIntoConstraints = false;
        
        let settingsIcon : UIImageView = {
            let imageView = UIImageView();
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "gear")
            return imageView
        }()
        
        let followButton : UIButton = {
            let button : UIButton = UIButton()
            button.setTitle("Following", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = UIColor.init(red: 3/255, green: 168/255, blue: 124/255, alpha: 1.0)
            button.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 13, bottom: 8, right: 13)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            button.layer.cornerRadius = 3
            return button
        }()
        
        
        bottomBlock.addSubview(settingsIcon)
        bottomBlock.addSubview(followButton)
        
        
        
        
        
        
        
        let followerBox2 = UIView()
        followerBox2.backgroundColor =  debug ? UIColor.brown : UIColor.white
        followerBox2.translatesAutoresizingMaskIntoConstraints = false
        let count2 : UILabel = {
            let label = UILabel()
            label.text = "5.81k"
            label.font = UIFont.systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let desc2 : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Followers"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = UIColor.gray
            return label
        }()
        
        rightColumn.addSubview(followerBox2)
        followerBox2.addSubview(count2)
        followerBox2.addSubview(desc2)
        
        rightColumn.addSubview(bottomBlock)
        
        
        
        
        let rcLead = rightColumn.leadingAnchor.constraint(equalTo: leftColumn.trailingAnchor)
        rcLead.identifier = "Right column leading"
        
        let rcTrail =  rightColumn.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        rcTrail.identifier = "Right column trailing"
        
        let rcTop = rightColumn.topAnchor.constraint(equalTo: mainView.topAnchor)
        rcTop.identifier = "RC top"
        
        let rcBottom = rightColumn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        rcBottom.identifier = "Rc Bottom"
        
        let rcHeigh = rightColumn.heightAnchor.constraint(equalToConstant: 160)
        rcHeigh.identifier = "Rc Height"
        
        NSLayoutConstraint.activate([
            mainTop,mainTrailing,mainBottom,mainLeading,
            
            leftColumn.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            leftColumn.topAnchor.constraint(equalTo: mainView.topAnchor),
            leftColumn.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            leftColumn.widthAnchor.constraint(equalToConstant: 90),
            
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.topAnchor.constraint(equalTo: leftColumn.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: leftColumn.leadingAnchor),
            //profileImage.bottomAnchor.constraint(equalTo: followerBox.topAnchor),
            
            
            followerBox.leadingAnchor.constraint(equalTo: leftColumn.leadingAnchor),
            followerBox.trailingAnchor.constraint(equalTo: leftColumn.trailingAnchor),
            followerBox.bottomAnchor.constraint(equalTo: leftColumn.bottomAnchor),
            followerBox.heightAnchor.constraint(equalToConstant: 40),
            
            count.bottomAnchor.constraint(equalTo: desc.topAnchor),
            count.leadingAnchor.constraint(equalTo: followerBox.leadingAnchor),
            
            desc.bottomAnchor.constraint(equalTo: followerBox.bottomAnchor , constant: -5),
            desc.leadingAnchor.constraint(equalTo: followerBox.leadingAnchor),
            
            
            rcLead,rcTrail,rcBottom,rcTop,
            
            profileDec.topAnchor.constraint(equalTo: rightColumn.topAnchor),
            profileDec.leadingAnchor.constraint(equalTo: rightColumn.leadingAnchor),
            profileDec.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor),
            profileDec.bottomAnchor.constraint(equalTo: followerBox2.topAnchor),
            
            profileName.topAnchor.constraint(equalTo: profileDec.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            profileName.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            
            dateJoined.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 3),
            dateJoined.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            dateJoined.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            
            about.topAnchor.constraint(equalTo: dateJoined.bottomAnchor, constant:3),
            about.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            about.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            about.bottomAnchor.constraint(equalTo: profileDec.bottomAnchor, constant: -5),
            
            followerBox2.leadingAnchor.constraint(equalTo: rightColumn.leadingAnchor),
            //followerBox2.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor),
            followerBox2.bottomAnchor.constraint(equalTo: rightColumn.bottomAnchor),
            followerBox2.heightAnchor.constraint(equalToConstant: 40),
            
            count2.bottomAnchor.constraint(equalTo: desc2.topAnchor),
            count2.leadingAnchor.constraint(equalTo: followerBox2.leadingAnchor),
            
            desc2.bottomAnchor.constraint(equalTo: followerBox2.bottomAnchor, constant: -4),
            desc2.leadingAnchor.constraint(equalTo: followerBox2.leadingAnchor),
            
            
            bottomBlock.leadingAnchor.constraint(equalTo: followerBox2.trailingAnchor),
            bottomBlock.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor),
            bottomBlock.bottomAnchor.constraint(equalTo: rightColumn.bottomAnchor),
            bottomBlock.heightAnchor.constraint(equalToConstant: 40),
            
            //settingsIcon.bottomAnchor.constraint(equalTo: bottomBlock.bottomAnchor),
            settingsIcon.centerYAnchor.constraint(equalTo: bottomBlock.centerYAnchor),
            settingsIcon.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant : -15),
            settingsIcon.heightAnchor.constraint(equalToConstant: 20),
            settingsIcon.widthAnchor.constraint(equalToConstant: 20),
            
            followButton.centerYAnchor.constraint(equalTo: bottomBlock.centerYAnchor),
            followButton.trailingAnchor.constraint(equalTo: bottomBlock.trailingAnchor),
            
            ])
    }
    }
