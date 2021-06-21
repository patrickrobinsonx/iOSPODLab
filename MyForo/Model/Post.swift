//
//  Post.swift
//  MyForo
//
//  Created by Patrick Robinson on 19/6/21.
//

import Foundation

struct Post:Codable {
    var userId:Int
    var id:Int
    var title:String
    var body:String

    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
}
