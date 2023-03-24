//
//  Post.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/24.
//

import SwiftUI

// `Codable` is a type alias for the `Encodable` and `Decodable` protocols.
// var id: Self.ID { get }
struct PostList: Codable {
    var list: [Post]
}

// data model
struct Post: Codable, Identifiable {
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

// いくつかの追加機能を拡張する
extension Post {
    var loadAvatarImage:Image {
        return Image(uiImage: UIImage(named: avatar)!)
    }
    
    var getCommentCountText: String {
        if commentCount <= 0 { return "comment" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var getLikeCountText: String {
        if likeCount <= 0 { return "like" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
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

func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
