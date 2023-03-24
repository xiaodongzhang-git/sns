//
//  Post.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/24.
//

import SwiftUI

// `Codable` is a type alias for the `Encodable` and `Decodable` protocols.
struct PostList: Codable {
    var list: [Post]
}

// data model
struct Post: Codable {
    // Property
    let id: Int
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    let text: String
    let images: [String]
    // let は定数を表し、var は変更可能な変数を表します。
    var isFollowed: Bool
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

let postList = loadPostListData("PostListData_recommend_1.json")

func loadPostListData(_ fileName: String ) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can not find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load \(url)")
    }

    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data")
    }
    
    return list
}
