//
//  TaichinhTableViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

struct COntact {
    var name: String
    var phone: String
    
}

class TaichinhTableViewController: UITableViewController {

    var personList = [
        COntact(name: "Nguyen xuan phuc", phone: "0234654894"),
        COntact(name: "vo gnuyen giap", phone: "0234654894"),
        COntact(name: "van tuan nguyen", phone: "0234654894"),
        COntact(name: "mot hai ba", phone: "0234654894"),
        COntact(name: "Hoang anh ole", phone: "0234654894"),
        COntact(name: "Thay giao ba", phone: "0234654894"),
        COntact(name: "truong vo ki", phone: "0234654894"),
        COntact(name: "Mao trach dong", phone: "0234654894"),
        COntact(name: "Donal trupm", phone: "0234654894"),
        COntact(name: "Nguyen le hung", phone: "0234654894"),
        ]
    
    let refresh = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.refreshControl = self.refresh
        refresh.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "2"), object: nil)
    }
    
    @objc func handleRefreshControl() {
        refresh.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
 
}
