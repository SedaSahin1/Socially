//
//  MessagesItemView.swift
//  Socially
//
//  Created by Seda Şahin on 4.05.2023.
//

import Foundation
import UIKit

class MessagesItemView: UICollectionViewCell {
    
    @IBOutlet weak var messageItemView: UIView!{
        didSet{
            messageItemView.layer.cornerRadius = 16
            messageItemView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
            messageItemView.layer.shadowColor = UIColor.gray.cgColor
            messageItemView.layer.shadowRadius = 16
            messageItemView.layer.shadowOpacity = 0.4
        }
    }
}
