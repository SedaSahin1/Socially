//
//  HomeModel.swift
//  Socially
//
//  Created by Seda Şahin on 5.05.2023.
//

import Foundation


struct HomeModel: Decodable {
    let stories: [Stories]
    let posts: [Posts]
}

struct Stories: Decodable {
    let image: String
}

struct Posts: Decodable {
    let image: String
    let userImage: String
    let userName: String
    let likeCount: String
    let saveCount: String
    let messageCount: String
    let postTime: String
}

