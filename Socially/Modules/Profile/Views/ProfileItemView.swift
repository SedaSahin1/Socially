//
//  ProfileItemView.swift
//  Socially
//
//  Created by Seda Şahin on 5.05.2023.
//

import Foundation
import UIKit

class ProfileItemView: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!{
        didSet{
            image.layer.cornerRadius = 8
        }
    }
}
