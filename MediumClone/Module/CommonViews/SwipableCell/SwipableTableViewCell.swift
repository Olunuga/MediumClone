//
//  SwipableTableViewCell.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 19/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit
import MaterialComponents.MDCCard

class SwipableTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView? =  nil
    var copmpactCellData : [String]? = nil
    let sectionTitleHeight = 43
    
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var mainContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sectionTitleHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lableSectionTitle: UILabel!
    @IBOutlet weak var sectionLabelContainer: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UINib(nibName: "CompactStoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "compactCell")
    }
    
    func hideTitle() {
        mainContainerViewHeightConstraint.constant = mainContainerViewHeightConstraint.constant - CGFloat(sectionTitleHeight)
        sectionTitleHeightConstraint.constant = 0
        lableSectionTitle.isHidden = true
    }
    
    
    func randomBackgroundColor() {
        //http://colrd.com/create/color
        let spaceRed = UIColor.init(red: 231/256, green: 220/255, blue: 219/255, alpha: 0.6)
        //__ = UIColor.init(red: 190/256, green: 220/255, blue: 219/255, alpha: 0.6)
        mainContainerView.backgroundColor = spaceRed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension SwipableTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compactCell", for: indexPath) as! CompactStoryCollectionViewCell
        cell.cornerRadius = 8
        cell.layer.masksToBounds = false
        cell.setShadowColor(UIColor(white: 0.5, alpha: 0.7), for: .normal)
        cell.setShadowColor(UIColor(white: 1, alpha: 0.3), for: .highlighted)
        cell.setShadowElevation(ShadowElevation(rawValue: 10), for: .normal)
        cell.setShadowElevation(ShadowElevation(rawValue: 1), for: .highlighted)
        cell.isSelectable = false

       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 290, height: 194)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10)
    }
  
}
