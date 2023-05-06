//
//  FavoritesViewController.swift
//  Socially
//
//  Created by Seda Şahin on 4.05.2023.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.register(UINib(nibName: "HomeItemCell", bundle:nil), forCellWithReuseIdentifier: "HomeItemCell")
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
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
        }
        favoritesCollectionView.setCollectionViewLayout(layout, animated: true)

    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:"HomeItemCell",
                        for: indexPath
                    ) as! HomeItemCell
    
        return cell
    }
}
