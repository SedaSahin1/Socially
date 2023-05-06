//
//  MessagesModel.swift
//  Socially
//
//  Created by Seda Şahin on 5.05.2023.
//

import Foundation


struct MessagesDetailModel: Decodable {
    let status: String
    let profile: String
    let nameSurname: String
    let messages: [MessageItem]
}

struct MessageItem: Decodable {
    let isMyself: String
    let message: String
}





