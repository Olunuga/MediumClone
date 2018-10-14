//
//  CreateViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 13/10/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit
import MaterialComponents.MDCCard

class CreateViewController : UIViewController, CustomButtonPressedDelegate {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        setUpView()
        self.view.backgroundColor = UIColor(white: 0.99, alpha: 1)
    }
    
    
    func pressed(identifier: String) {
        print("button tag \(identifier) pressed")
    }
    
    func setUpView() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "typewriter")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let writeSeriesButton = CustomButton()
        writeSeriesButton.translatesAutoresizingMaskIntoConstraints = false
        
        let writeStoryButton = CustomButton()
        writeStoryButton.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(writeStoryButton)
        self.view.addSubview(writeSeriesButton)
        self.view.addSubview(imageView)
        //self.view.insertSubview(imageView, belowSubview: navigationBar)
        
        imageView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        writeStoryButton.bottomAnchor.constraint(greaterThanOrEqualTo: writeSeriesButton.topAnchor, constant: -20).isActive = true
        writeStoryButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        writeStoryButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        writeStoryButton.delegate = self
        writeStoryButton.identifier = "write"
        
        writeStoryButton.title.text = "Write a story"
        writeStoryButton.summary.text = "Medium stories are the easiest way to share your ideas with the world."
        
        writeSeriesButton.bottomAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
        writeSeriesButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        writeSeriesButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        writeSeriesButton.delegate = self
        writeSeriesButton.identifier = "series"
        
        writeSeriesButton.title.text = "Create a Series"
        writeSeriesButton.summary.text = "Medium Series are mobile stories that can be added to over time and unfold card by card with the tap of a finger"
    }
}

protocol CustomButtonPressedDelegate {
    func pressed(identifier:String)
}

class CustomButton : MDCCard{
    var delegate : CustomButtonPressedDelegate? = nil
    var identifier : String? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        self.setShadowElevation(ShadowElevation(rawValue: 5), for: .normal)
        self.setShadowColor(UIColor(white: 0.5, alpha: 0.7), for: .normal)
        self.cornerRadius = 4
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CustomButton.pressed))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func pressed(){
        if let ourDelegate = delegate {
            ourDelegate.pressed(identifier: self.identifier ?? "default")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let summary : UILabel = {
        let summaryLabel = UILabel()
        summaryLabel.numberOfLines = 0
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.lineBreakMode = .byWordWrapping
        summaryLabel.textAlignment = .left
        summaryLabel.textColor = UIColor.darkGray
        return summaryLabel
    }()
    
    let icon : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    func setUpViews() {
        addSubview(icon)
        addSubview(title)
        addSubview(summary)
        
        let constraint =  NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(14)]-16-[v1]", options: .alignAllTop, metrics: nil, views: ["v0":icon, "v1":title])
        NSLayoutConstraint.activate(constraint)
        
        let verticalConstraint =  NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v1]-16-|", options: .alignAllLeading, metrics: nil, views: ["v0":title, "v1":summary])
        NSLayoutConstraint.activate(verticalConstraint)
        
        let iconConstraint =  NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]", options: .alignAllLeading, metrics: nil, views: ["v0":icon])
        NSLayoutConstraint.activate(iconConstraint)
        
        summary.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
}
