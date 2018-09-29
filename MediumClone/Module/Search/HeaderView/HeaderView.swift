//
//  HeaderView.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 24/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

protocol ClearButtonProtocol {
    func onClearButtonPressed()
}

class HeaderView: UIView {
    
    var delegate: ClearButtonProtocol? = nil
    
    override func awakeFromNib() {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func clearButtonPressed(_ sender: UIButton) {
        if delegate != nil {
            delegate?.onClearButtonPressed()
        }
    }
    
}
