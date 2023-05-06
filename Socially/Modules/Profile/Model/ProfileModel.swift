//
//  ProfileModel.swift
//  Socially
//
//  Created by Seda Şahin on 4.05.2023.
//

import Foundation

struct BlogPost: Decodable {
    let nameSurname: String
    let userName: String
    let image: String
    let follower: String
    let follows: String
    let posts: [Posts]
}

struct Posts: Decodable {
    let userName: String
    let image: String
}
