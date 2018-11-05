//
//  WideStoryViewCell.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 18/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

protocol onStoryItemClickedProtocol {
    //should contain the id of the data that was pressed
    func buttonPressed(action : Action)
}

enum Action {
    case menu
    case bookMark
}

class WideStoryViewCell: UITableViewCell {
    var delegate : onStoryItemClickedProtocol? = nil
    @IBOutlet weak var actionMenuWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bookmarkButtonTrailingContraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var buttonBookmark: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setDelegate(delegate : onStoryItemClickedProtocol){
        self.delegate = delegate
    }
    
    @IBAction func menuPressed(_ sender: UIButton) {
        if let deleg = delegate {
            deleg.buttonPressed(action: .menu)
        }
    }
    
    @IBAction func bookMarkPressed(_ sender: UIButton) {
        if let deleg = delegate {
            deleg.buttonPressed(action: .bookMark)
        }
    }
}
