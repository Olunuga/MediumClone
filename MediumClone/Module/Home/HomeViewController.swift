//
//  HomeViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 18/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "WideStoryViewCell", bundle: nil), forCellReuseIdentifier: "wideCell")
        tableView.register(UINib(nibName: "SwipableTableViewCell", bundle: nil), forCellReuseIdentifier: "swipeCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240.0
        tableView.separatorColor = UIColor(white: 0.5, alpha: 0.3)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8;
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let wideCell = tableView.dequeueReusableCell(withIdentifier: "wideCell", for: indexPath) as! WideStoryViewCell
        wideCell.selectionStyle = .none
        
        let swipeCell = tableView.dequeueReusableCell(withIdentifier: "swipeCell", for: indexPath) as! SwipableTableViewCell
        swipeCell.selectionStyle = .none
        swipeCell.hideTitle()
        swipeCell.copmpactCellData = [String]()
        
        
        let swipeCell2 = tableView.dequeueReusableCell(withIdentifier: "swipeCell", for: indexPath) as! SwipableTableViewCell
        swipeCell2.selectionStyle = .none
        swipeCell2.randomBackgroundColor()
        swipeCell2.copmpactCellData = [String]()

        if indexPath.row == 0 {
            return swipeCell
        }
        
        if indexPath.row == 5 {
            return swipeCell2
        }
       
        return wideCell
    }
    
    
    
}
