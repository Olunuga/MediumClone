//
//  ProfileDetailCell.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 10/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class ProfileDetailCell : UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        let rightColumn = UIView()
        let leftColumn = UIView()
        
        let followerBox = UIView()
        let count : UILabel = {
            let label = UILabel()
            label.text = "5.81k"
            label.font = UIFont.systemFont(ofSize: 13)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let desc : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Following"
            label.font = UIFont.systemFont(ofSize: 13)
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
        //profileDec.backgroundColor = UIColor.purple
        let profileName : UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "John Cousins"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let dateJoined : UILabel = {
            let label = UILabel()
             label.textColor = UIColor.green
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = "Member since july 2018"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let about : UILabel = {
            let label = UILabel()
            label.text = "Distilling business ideas. I write down my thoughts so others can understand my logic and help improve it. Get free biz books http://eepurl.com/b8UzpL"
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 14)
            label.lineBreakMode = .byWordWrapping
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        
        
        
        
        followerBox.addSubview(count)
        followerBox.addSubview(desc)
        
        rightColumn.translatesAutoresizingMaskIntoConstraints = false
        //rightColumn.backgroundColor = UIColor.yellow
        
        leftColumn.translatesAutoresizingMaskIntoConstraints = false
        //leftColumn.backgroundColor = UIColor.green
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        followerBox.translatesAutoresizingMaskIntoConstraints = false
        //followerBox.backgroundColor = UIColor.red
        
        
        
        contentView.addSubview(rightColumn)
        contentView.addSubview(leftColumn)
        
        rightColumn.addSubview(profileDec)
        profileDec.addSubview(profileName)
         profileDec.addSubview(dateJoined)
         profileDec.addSubview(about)
        
        leftColumn.addSubview(profileImage)
        leftColumn.addSubview(followerBox)
        
        
        
        
        
        
        
        
        let followerBox2 = UIView()
        //ollowerBox2.backgroundColor = UIColor.brown
        followerBox2.translatesAutoresizingMaskIntoConstraints = false
        let count2 : UILabel = {
            let label = UILabel()
            label.text = "5.81k"
            label.font = UIFont.systemFont(ofSize: 13)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let desc2 : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Followers"
            label.font = UIFont.systemFont(ofSize: 13)
            return label
        }()
        
        followerBox2.addSubview(count2)
        followerBox2.addSubview(desc2)
        
        rightColumn.addSubview(followerBox2)
        
        
    
        
        NSLayoutConstraint.activate([
            leftColumn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            leftColumn.topAnchor.constraint(equalTo: contentView.topAnchor),
            leftColumn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            leftColumn.widthAnchor.constraint(equalToConstant: 90),
            
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.topAnchor.constraint(equalTo: leftColumn.topAnchor),
            profileImage.centerXAnchor.constraint(equalTo: leftColumn.centerXAnchor),
            
            
            followerBox.leadingAnchor.constraint(equalTo: leftColumn.leadingAnchor, constant:16),
            followerBox.trailingAnchor.constraint(equalTo: leftColumn.trailingAnchor),
            followerBox.bottomAnchor.constraint(equalTo: leftColumn.bottomAnchor, constant: -5),
            followerBox.heightAnchor.constraint(equalToConstant: 40),
            
            count.bottomAnchor.constraint(equalTo: desc.topAnchor),
            count.leadingAnchor.constraint(equalTo: followerBox.leadingAnchor),
            
            desc.bottomAnchor.constraint(equalTo: followerBox.bottomAnchor),
            desc.leadingAnchor.constraint(equalTo: followerBox.leadingAnchor),
            
            
            
            rightColumn.leadingAnchor.constraint(equalTo: leftColumn.trailingAnchor, constant: 10),
            rightColumn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rightColumn.topAnchor.constraint(equalTo: contentView.topAnchor),
            rightColumn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rightColumn.heightAnchor.constraint(equalToConstant: 160),
            
            profileDec.topAnchor.constraint(equalTo: rightColumn.topAnchor),
            profileDec.leadingAnchor.constraint(equalTo: rightColumn.leadingAnchor),
            profileDec.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor),
            profileDec.bottomAnchor.constraint(equalTo: followerBox2.topAnchor),
            
            profileName.topAnchor.constraint(equalTo: profileDec.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            profileName.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            
            dateJoined.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 5),
            dateJoined.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            dateJoined.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            
            about.topAnchor.constraint(equalTo: dateJoined.bottomAnchor, constant: 5),
            about.leadingAnchor.constraint(equalTo: profileDec.leadingAnchor),
            about.trailingAnchor.constraint(equalTo: profileDec.trailingAnchor),
            
            
            followerBox2.topAnchor.constraint(equalTo: profileDec.bottomAnchor),
            followerBox2.leadingAnchor.constraint(equalTo: rightColumn.leadingAnchor),
            followerBox2.trailingAnchor.constraint(equalTo: rightColumn.trailingAnchor),
            followerBox2.bottomAnchor.constraint(equalTo: rightColumn.bottomAnchor, constant: -5),
            followerBox2.heightAnchor.constraint(equalToConstant: 40),
            
            count2.bottomAnchor.constraint(equalTo: desc2.topAnchor),
            count2.leadingAnchor.constraint(equalTo: followerBox2.leadingAnchor),
            
            desc2.bottomAnchor.constraint(equalTo: followerBox2.bottomAnchor),
            desc2.leadingAnchor.constraint(equalTo: followerBox2.leadingAnchor),
            ])
    }
}



