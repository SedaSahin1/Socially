//
//  HomeItemCell.swift
//  Socially
//
//  Created by Seda Şahin on 2.05.2023.
//

import Foundation
import UIKit

class HomeItemCell : UICollectionViewCell {
    
    @IBOutlet weak var saveView: UIView!{
        didSet{
            saveView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var messageView: UIView!{
        didSet{
            messageView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var likeView: UIView!{
        didSet{
            likeView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var saveCount: UILabel!
    @IBOutlet weak var messageCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var itemImage: UIImageView!{
        didSet{
            itemImage.layer.cornerRadius = 16
        }
    }
}
