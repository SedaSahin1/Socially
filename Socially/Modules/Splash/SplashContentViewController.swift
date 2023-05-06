//
//  SplashContentViewController.swift
//  Socially
//
//  Created by Seda Şahin on 2.05.2023.
//

import Foundation
import UIKit

class SplashContentViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isUserInteractionEnabled = true
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped)))

    }
    
    @objc func nextButtonTapped() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "TabPageViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
