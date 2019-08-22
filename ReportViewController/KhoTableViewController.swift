//
//  KhoTableViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

struct Store {
    var name: String
    var price: Int
    var image: UIImage
}

class KhoTableViewController: UITableViewController {
    var itemList = [
        Store(name: "Can sa", price: 100000, image: #imageLiteral(resourceName: "can")),
        Store(name: "Ma tuy", price: 200000, image: #imageLiteral(resourceName: "matuy")),
        Store(name: "Thuoc phien", price: 50000, image: #imageLiteral(resourceName: "thuocphien")),
        Store(name: "Xi ke", price: 23135456, image: #imageLiteral(resourceName: "can")),
        Store(name: "Can sa", price: 100000, image: #imageLiteral(resourceName: "can")),
        Store(name: "Ma tuy", price: 200000, image: #imageLiteral(resourceName: "matuy")),
        Store(name: "Thuoc phien", price: 50000, image: #imageLiteral(resourceName: "thuocphien")),
        Store(name: "Xi ke", price: 23135456, image: #imageLiteral(resourceName: "can")),
        Store(name: "Can sa", price: 100000, image: #imageLiteral(resourceName: "can")),
        Store(name: "Ma tuy", price: 200000, image: #imageLiteral(resourceName: "matuy")),
        Store(name: "Thuoc phien", price: 50000, image: #imageLiteral(resourceName: "thuocphien")),
        Store(name: "Xi ke", price: 23135456, image: #imageLiteral(resourceName: "can")),
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "1"), object: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemList[indexPath.row].name
        cell.detailTextLabel?.text = "\(itemList[indexPath.row].price)"
        cell.imageView?.image = itemList[indexPath.row].image
        return cell
    }
}
