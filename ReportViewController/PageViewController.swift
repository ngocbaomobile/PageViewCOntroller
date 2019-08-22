//
//  PageViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    

  

    
    lazy var orederedViewcontrollers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "banhang"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "kho"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "taichinh")
        ]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
      
        //setdefault
        if let defaultVIewcontroller = orederedViewcontrollers.first {
            
            setViewControllers([defaultVIewcontroller], direction: .forward, animated: true, completion: nil)
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(setViewchanged(notification:)), name: NSNotification.Name(rawValue: "banhang"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setViewchanged(notification:)), name: NSNotification.Name(rawValue: "kho"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setViewchanged(notification:)), name: NSNotification.Name(rawValue: "taichinh"), object: nil)
        
    }
    
    
    
    
    
    
    @objc func setViewchanged(notification: Notification){
        switch notification.name.rawValue {
        case "banhang":
            if let banhangView = orederedViewcontrollers.first {
                
                setViewControllers([banhangView], direction: .forward, animated: true, completion: nil)
            }
        case "kho":
            
             let khoView = orederedViewcontrollers[1]
            setViewControllers([khoView], direction: .forward, animated: true, completion: nil)
        default:
            
            if let taichinh = orederedViewcontrollers.last {
                setViewControllers([taichinh], direction: .forward, animated: true, completion: nil)
            }
        }
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let indexViewcontroller = orederedViewcontrollers.index(of: viewController) else {return nil}
        
        print(indexViewcontroller)
        let previousIndex = indexViewcontroller - 1
       
        guard previousIndex >= 0 else {
           // return orederedViewcontrollers.last
            return nil
        }
        
        guard orederedViewcontrollers.count > previousIndex else { return nil}
        return orederedViewcontrollers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let indexViewcontroller = orederedViewcontrollers.index(of: viewController) else { return nil}
        print(indexViewcontroller)
        let nextIndex = indexViewcontroller + 1
       
        
        guard orederedViewcontrollers.count != nextIndex else {
            //return orederedViewcontrollers.first
            return nil
        }
        
        return orederedViewcontrollers[nextIndex]
    }

    
}
