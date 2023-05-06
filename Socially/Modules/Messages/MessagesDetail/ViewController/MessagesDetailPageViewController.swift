//
//  MessagesDetailPageViewController.swift
//  Socially
//
//  Created by Seda Şahin on 5.05.2023.
//

import Foundation
import UIKit

class MessagesDetailPageViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var nameSurname: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var sendButton: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var messageDetailValues: MessagesDetailModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonData = MESSAGESDETAIL.data(using: .utf8)!
        messageDetailValues = try! JSONDecoder().decode(MessagesDetailModel.self, from: jsonData)
    
        status.text = messageDetailValues?.status
        nameSurname.text = messageDetailValues?.nameSurname
        photo.image = UIImage(named: messageDetailValues?.profile ?? "")
        
        
        searchView.layer.cornerRadius = 8
        searchView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        searchView.layer.shadowColor = UIColor.gray.cgColor
        searchView.layer.shadowRadius = 8
        searchView.layer.shadowOpacity = 0.4
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MessagesDetailItemView", bundle:nil), forCellWithReuseIdentifier: "MessagesDetailItemView")
        collectionView.register(UINib(nibName: "MessagesDetailMyselfItemView", bundle:nil), forCellWithReuseIdentifier: "MessagesDetailMyselfItemView")
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, enviroment in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                   , heightDimension: .estimated(100))
                   let item = NSCollectionLayoutItem(layoutSize: itemSize)
                   
                   let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
                                                          , heightDimension: .fractionalHeight(1))
                   let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
                   , subitems: [item])
                   group.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0
                   , bottom: 0, trailing: 0)
                   
                   let section = NSCollectionLayoutSection(group: group)
                   section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20
                   , bottom: 10, trailing: 20)
                   
                   return section
        }
        
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension MessagesDetailPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return messageDetailValues?.messages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if messageDetailValues?.messages[indexPath.row].isMyself == "true" {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier:"MessagesDetailMyselfItemView",
                            for: indexPath
                        ) as! MessagesDetailMyselfItemView
           
            cell.message.text =  messageDetailValues?.messages[indexPath.row].message
            return cell
        }
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier:"MessagesDetailItemView",
                        for: indexPath
                    ) as! MessagesDetailItemView
       
        cell.message.text = messageDetailValues?.messages[indexPath.row].message
        return cell
    }
}
