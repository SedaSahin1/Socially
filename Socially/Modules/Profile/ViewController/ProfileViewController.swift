//
//  ProfileViewController.swift
//  Socially
//
//  Created by Seda Şahin on 3.05.2023.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var nameSurname: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var followsCount: UILabel!
    internal var tabs: [Tab] = []
    @IBOutlet weak var tabbedView: TabbedPageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = USER.data(using: .utf8)!
        let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)

        postCount.text = "\(blogPost.posts.count)"
        followsCount.text = blogPost.follows
        followerCount.text = blogPost.follower
        nameSurname.text = blogPost.nameSurname
        userName.text = "@\(blogPost.userName)"
        profileImage.image = UIImage(named: blogPost.image)
        reload()
    }
    
    func reload(){
        
        let controller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfilePostViewController") as! ProfilePostViewController
        let controller2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfilePostViewController") as! ProfilePostViewController
        
        tabs = [
            Tab(contentSource: .viewController(controller1), type: .icon(UIImage(named: "icon_photos"))),
            Tab(contentSource: .viewController(controller2), type: .icon(UIImage(named: "icon_saved")))
        ]
        
        tabbedView.tabBar.position = .top
        tabbedView.tabBar.sliderColor = UIColor(red: 0.00, green: 0.59, blue: 0.77, alpha: 1.00)
        tabbedView.tabBar.transitionStyle = .sticky
        tabbedView.tabBar.tabWidth = 130
        tabbedView.delegate = self
        tabbedView.dataSource = self
        tabbedView.reloadData()
    }
}

extension ProfileViewController: TabbedPageViewDelegate, TabbedPageViewDataSource {
    func tabbedPageView(_ tabbedPageView: TabbedPageView, tabForIndex index: Int) -> Tab {
        return tabs[index]
    }
    
    func numberOfTabs(in tabbedPageView: TabbedPageView) -> Int {
        return tabs.count
    } 
}
