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
    @IBOutlet weak var profileCollectionView: UICollectionView!
    var userInformation: BlogPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = USER.data(using: .utf8)!
        let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)
        userInformation = blogPost
        postCount.text = "\(blogPost.posts.count)"
        followsCount.text = blogPost.follows
        followerCount.text = blogPost.follower
        nameSurname.text = blogPost.nameSurname
        userName.text = "@\(blogPost.userName)"
        profileImage.image = UIImage(named: blogPost.image)
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        profileCollectionView.register(UINib(nibName: "ProfileItemView", bundle:nil), forCellWithReuseIdentifier: "ProfileItemView")
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5)
                                                  , heightDimension: .fractionalHeight(1))
                   let item = NSCollectionLayoutItem(layoutSize: itemSize)
                   
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                                          , heightDimension: .absolute(200))
                   let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize
                   , subitems: [item])
                   group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0
                   , bottom: 0, trailing: 0)
                   
                   let section = NSCollectionLayoutSection(group: group)
                   section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10
                   , bottom: 10, trailing: 10)
                   
                   return section
        }
        
        profileCollectionView.setCollectionViewLayout(layout, animated: true)
       
    }
   
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return userInformation?.posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:"ProfileItemView",
                        for: indexPath
                    ) as! ProfileItemView
        cell.image.image = UIImage(named: userInformation?.posts[indexPath.row].image ?? "")
        return cell
    }
}

