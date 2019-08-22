//
//  ViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

protocol PageViewcontrollerDelegate: class {
    var selectedIndex: Int {get set}
}


class ViewController: UIViewController, PageViewcontrollerDelegate {
   
    
    var selectedIndex: Int = 0 {
        didSet {
            let sender = headerButtons[selectedIndex]
            UIView.animate(withDuration: 0.35) {
                self.buttonLine.frame = CGRect(x: sender.frame.minX, y: sender.frame.maxY, width: sender.frame.width, height: 2)
            }
            pageVCDelegate?.selectedIndex = selectedIndex
        }
    }
    
    weak var pageVCDelegate: PageViewcontrollerDelegate?
    
    @IBOutlet var headerButtons: [UIButton]!
    @IBOutlet weak var buttonLine: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let sender = headerButtons[selectedIndex]
        self.buttonLine.frame = CGRect(x: sender.frame.minX, y: sender.frame.maxY , width: sender.frame.width, height: 2)
        view.layoutIfNeeded()
        pageVCDelegate?.selectedIndex = selectedIndex
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSelectedIndex(notification:)), name: NSNotification.Name(rawValue: "0"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSelectedIndex(notification:)), name: NSNotification.Name(rawValue: "1"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setSelectedIndex(notification:)), name: NSNotification.Name(rawValue: "2"), object: nil)
        
    }
    
    
   @objc func setSelectedIndex(notification: Notification) {
        switch notification.name.rawValue {
        case "0":
            selectedIndex = 0
            
        case "1":
            selectedIndex = 1
            
        default:
            selectedIndex = 2
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.embedPageVc.rawValue:
            pageVCDelegate = segue.destination as? PageViewcontrollerDelegate
        default:
            return
        }
    }
    
    
    func updatePageview(){
        
    }
    

    @IBAction func onClickButton(sender: UIButton) {
        
      selectedIndex = headerButtons.firstIndex(of: sender) ?? 0
     
        if let titleButton = sender.currentTitle {
            switch titleButton {
            case "Bán Hàng":
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "banhang"), object: nil)
            case "Kho":
               
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kho"), object: nil)
            default:
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "taichinh"), object: nil)
            }
        }
    }
    

    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("banhang"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("kho"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("taichinh"), object: nil)
    }
    
}

enum SegueIdentifier: String {
    case embedPageVc = "pagviewSegue"
}
