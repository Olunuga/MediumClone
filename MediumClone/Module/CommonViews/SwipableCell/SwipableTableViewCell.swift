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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(UINib(nibName: "CompactStoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "compactCell")
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
        cell.setShadowColor(UIColor(white: 0.6, alpha: 0.3), for: .normal)
        cell.setShadowColor(UIColor(white: 1, alpha: 0.3), for: .highlighted)
        cell.setShadowElevation(ShadowElevation(rawValue: 4), for: .normal)
        cell.setShadowElevation(ShadowElevation(rawValue: 1), for: .highlighted)
        cell.isSelectable = false

       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 270, height: 174)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 10)
    }
  
}
