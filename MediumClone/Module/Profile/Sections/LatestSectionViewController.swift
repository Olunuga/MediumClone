//
//  LatestSectionViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 13/01/2019.
//  Copyright © 2019 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class LatestSectionViewController : UIViewController{
    
    override func viewDidLoad() {
        setUpViews()
    }
    
    func setUpViews(){
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Lates section"
        view.addSubview(lable)
        
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: view.topAnchor),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
        
    }
}
