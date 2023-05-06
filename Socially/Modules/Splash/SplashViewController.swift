//
//  SplashViewController.swift
//  Socially
//
//  Created by Seda Şahin on 2.05.2023.
//

import Foundation
import UIKit

class SplashViewController : UIPageViewController{
    let pages = ["SplashFirstContentViewController", "SplashSecondContentViewController", "SplashThirdContentViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        setViewControllers([viewControllerAtIndex(index: 0)!], direction: .forward, animated: true, completion: nil)
        didMove(toParent: self)
    }
}

extension SplashViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    // MARK: Page View Controller Datasources
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore
                                viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.firstIndex(of: viewController.restorationIdentifier!){
            if index > 0 {
                return viewControllerAtIndex(index: index - 1)
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.firstIndex(of: viewController.restorationIdentifier!){
            if index < pages.count - 1 {
                return viewControllerAtIndex(index: index + 1)
                
            }
        }
        return nil
    }
    
    func viewControllerAtIndex(index: Int)-> UIViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:pages[index])
    }
}
