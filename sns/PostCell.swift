//
//  PostCell.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/22.
//

import SwiftUI

struct PostCell: View {
    let post:Post
    
    var body: some View {
        // HStack: コントロールは水平に配置
        HStack(spacing: 5) {
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle()) // 画像を円に設定する
                .overlay( // カバー
                    PostVIPBadge(vip: post.vip)
                        .offset(x: 16, y: 16)
                )
            
            // leading: left
            VStack(alignment: .leading, spacing: 5) {
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                    .lineLimit(1)
                Text(post.date)
                // 推測できる場合は、ポイントの前のパラメーターを省略できます。（.system .gray）
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            if (!post.isFollowed) {
                Spacer()
                
                Button(action: {
                    print("Click follow button")
                }) {
                    Text("フォロー")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                        .frame(width: 100, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.orange, lineWidth: 1)
                        )
                }
            }
        }
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[1])
    }
}
