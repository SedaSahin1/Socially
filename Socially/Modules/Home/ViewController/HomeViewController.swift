//
//  HomeViewController.swift
//  Socially
//
//  Created by Seda Şahin on 2.05.2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var homeValues: HomeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = HOME.data(using: .utf8)!
        homeValues = try! JSONDecoder().decode(HomeModel.self, from: jsonData)
    
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(UINib(nibName: "HomeItemCell", bundle:nil), forCellWithReuseIdentifier: "HomeItemCell")
        homeCollectionView.register(UINib(nibName: "HomeStoryCell", bundle:nil), forCellWithReuseIdentifier: "HomeStoryCell")
        
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
                    switch sectionIndex {
                    case 0 :
                        
                        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                               
                               let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(80), heightDimension: .absolute(64)), subitems: [item])
                               group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25)
                               
                               let section = NSCollectionLayoutSection(group: group)
                               section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: -10)
                               section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                            
                               return section
                        
                    case 1 :
                        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                               , heightDimension: .fractionalHeight(1))
                               let item = NSCollectionLayoutItem(layoutSize: itemSize)
                               
                               let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                                                      , heightDimension: .absolute(350))
                               let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                               , subitems: [item])
                               group.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0
                               , bottom: 0, trailing: 0)
                               
                               let section = NSCollectionLayoutSection(group: group)
                               section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20
                               , bottom: 10, trailing: 20)
                               
                               return section

                        
                    default:
                        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                               , heightDimension: .fractionalHeight(1))
                               let item = NSCollectionLayoutItem(layoutSize: itemSize)
                               
                               let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                               , heightDimension: .absolute(180))
                               let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                               , subitems: [item])
                               group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                               , bottom: 8, trailing: 0)
                               
                               let section = NSCollectionLayoutSection(group: group)
                               section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
                               , bottom: 10, trailing: 15)
                               
                               return section
                    }
                }
        homeCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return (homeValues?.stories.count ?? 0) + 1
        }
        return homeValues?.posts.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0  {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:"HomeStoryCell",
                            for: indexPath
                        ) as! HomeStoryCell
            if indexPath.row == 0{
                cell.storyIcon.image = UIImage(named: "button_add_story")
            } else {
                cell.storyIcon.image = UIImage(named: homeValues?.stories[indexPath.row - 1].image ?? "")
            }
            
            return cell
        }
      
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:"HomeItemCell",
                        for: indexPath
                    ) as! HomeItemCell
        cell.profileImage.image = UIImage(named: homeValues?.posts[indexPath.row].userImage ?? "")
        cell.userName.text = homeValues?.posts[indexPath.row].userName
        cell.itemImage.image = UIImage(named: homeValues?.posts[indexPath.row].image ?? "")
        cell.postTime.text = homeValues?.posts[indexPath.row].postTime
        cell.likeCount.text = homeValues?.posts[indexPath.row].likeCount
        cell.saveCount.text = homeValues?.posts[indexPath.row].saveCount
        cell.messageCount.text = homeValues?.posts[indexPath.row].messageCount
        
        return cell
    }
    
    
    
}
