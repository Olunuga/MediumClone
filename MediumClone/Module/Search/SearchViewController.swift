//
//  SearchViewController.swift
//  MediumClone
//
//  Created by OLUNUGA Mayowa on 22/09/2018.
//  Copyright © 2018 OLUNUGA Mayowa. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var sampleData : [String] = ["Some random data", "another random data", "new random data", "Some other random data", "again random data"]
     var suggestedSearchData : [String] = ["Android", "Android app development", "Architecture", "Art", "Creativity", "Design", "Economics", "Entrepreneuship", "Finance", "Future", "Gamming", "Google"]

    @IBOutlet weak var labelCancel: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var useSuggesteData = false;
    
    var suggestedHeaderview :SuggestedHeaderView? = nil;
    var searchHistoryHeader : HeaderView? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpSearchHistory()
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
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
       useSuggesteData = true
       labelCancel.isHidden = true
       clearSearchHistory();
       setUpSuggestedCell()
    }
    
    func setUpTableView(){
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorColor = UIColor(white: 0.7, alpha: 0.2)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "SearchItemViewCell", bundle: nil), forCellReuseIdentifier: "searchCell")
        tableView.register(UINib(nibName: "SuggestedTableViewCell", bundle: nil), forCellReuseIdentifier: "suggestedCell")
        tableView.tableFooterView = UIView()
    }
    
    func setUpSearchHistory(){
         searchHistoryHeader = (Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)![0] as? HeaderView)
        searchHistoryHeader?.delegate = self
        tableView.tableHeaderView = searchHistoryHeader
    }
    
    func setUpSuggestedCell(){
         suggestedHeaderview = (Bundle.main.loadNibNamed("SuggestedHeaderView", owner: self, options: nil)![0] as? SuggestedHeaderView)
         self.tableView.tableHeaderView = suggestedHeaderview
        tableView.separatorStyle = .none
    }
    
    
    func clearSearchHistory()  {
        self.tableView.tableHeaderView = nil
        self.sampleData = [String]()
        self.tableView.reloadData()
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if useSuggesteData{
            return suggestedSearchData.count
        }else{
             return sampleData.count;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if useSuggesteData {
            let cell = tableView.dequeueReusableCell(withIdentifier: "suggestedCell") as! SuggestedTableViewCell
            cell.suggestionLabel.text = suggestedSearchData[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchItemViewCell
            cell.labelSearchHistory.text = sampleData[indexPath.row]
            return cell
        }
       
    }
}

extension SearchViewController : ClearButtonProtocol {
    func onClearButtonPressed() {
      self.clearSearchHistory()
    }
}
