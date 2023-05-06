//
//  MessagesDetailMyselfItemView.swift
//  Socially
//
//  Created by Seda Şahin on 6.05.2023.
//

import Foundation
import UIKit

class MessagesDetailMyselfItemView: UICollectionViewCell {
    
    @IBOutlet weak var messageView: UIView!{
        didSet{
            messageView.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var message: UILabel!
}
