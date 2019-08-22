//
//  BanhangTableViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class BanhangTableViewController: UITableViewController {

    var number = [Int]()
    
    var refreshCtrol = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        number = [Int](1...100)
        
        tableView.refreshControl = self.refreshCtrol
        refreshCtrol.attributedTitle = NSAttributedString(string: "Loading...")
        refreshCtrol.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        }
    
    @objc func handleRefreshControl() {
            refreshCtrol.endRefreshing()
        }
    
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "0"), object: nil)
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(number[indexPath.row])"
        
        cell.layer.zPosition        = 50
        cell.layer.shadowColor      = UIColor.black.cgColor
        cell.layer.shadowOffset     = CGSize.zero
        cell.layer.shadowRadius     = 4
        cell.layer.shadowOpacity    = 0.3
        cell.layer.position = .init(x: 1, y: 0)
        let shadowFrame: CGRect     = cell.layer.bounds
        let shadowPath: CGPath      = UIBezierPath(rect: shadowFrame).cgPath
        cell.layer.shadowPath       = shadowPath
        cell.layer.masksToBounds    = false
        
        return cell
    }
}
