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
        VStack(alignment: .leading, spacing: 10) {
            // HStack: コントロールは水平に配置
            HStack(spacing: 5) {
                post.loadAvatarImage
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
            
            Text(post.text)
                .font(.system(size: 14))
            
            if (!post.images.isEmpty){
                loadImage(name: post.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 45, height: (UIScreen.main.bounds.width - 45) * 0.75)
                // .clipped 余分な部分を切り落と
                    .clipped()
            }
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                
                PostCellToolbarButton(image: "message",
                                      text: post.getCommentCountText,
                                      color: .black)
                {
                    print("Click comment button")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart",
                                      text: post.getLikeCountText,
                                      color: .black)
                {
                    print("Click like button")
                }
                Spacer()
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
        .padding(.horizontal, 30)
        .padding(.top, 15)
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
