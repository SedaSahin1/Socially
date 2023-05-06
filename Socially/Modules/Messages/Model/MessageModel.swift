//
//  MessagesModel.swift
//  Socially
//
//  Created by Seda Şahin on 5.05.2023.
//

import Foundation
import UIKit

struct Messages: Decodable {
    let messages: [Message]
}

struct Message: Decodable {
    let name: String
    let image: String
    let message: String
}
