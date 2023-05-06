//
//  MessagesViewController.swift
//  Socially
//
//  Created by Seda Şahin on 4.05.2023.
//

import Foundation
import UIKit

class MessagesViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var messagesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.layer.cornerRadius = 8
        searchView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        searchView.layer.shadowColor = UIColor.gray.cgColor
        searchView.layer.shadowRadius = 8
        searchView.layer.shadowOpacity = 0.4
        messagesCollectionView.delegate = self
        messagesCollectionView.dataSource = self
        messagesCollectionView.register(UINib(nibName: "MessagesItemView", bundle:nil), forCellWithReuseIdentifier: "MessagesItemView")
        
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                   , heightDimension: .fractionalHeight(1))
                   let item = NSCollectionLayoutItem(layoutSize: itemSize)
                   
                   let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                                          , heightDimension: .absolute(100))
                   let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                   , subitems: [item])
                   group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                   , bottom: 20, trailing: 0)
                   
                   let section = NSCollectionLayoutSection(group: group)
                   section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
                   , bottom: 0, trailing: 0)
                   
                   return section
            
        }
        messagesCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension MessagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:"MessagesItemView",
                        for: indexPath
                    ) as! MessagesItemView
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "MessagesDetailPageViewController")
    
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
