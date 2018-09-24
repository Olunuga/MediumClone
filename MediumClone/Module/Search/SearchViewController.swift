//
//  SearchViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 22/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorColor = UIColor(white: 0.7, alpha: 0.2)
         tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SearchItemViewCell", bundle: nil), forCellReuseIdentifier: "searchCell")
        tableView.tableFooterView = UIView()
        
        let view = (Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as? HeaderView)
        tableView.tableHeaderView = view
        
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.linear)
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: false, completion: nil)
    }
    

}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchItemViewCell
        cell.labelSearchHistory.text = "Some random text"
        return cell
    }
    
    
    
}
