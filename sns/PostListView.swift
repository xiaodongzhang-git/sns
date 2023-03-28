//
//  PostListView.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/24.
//

import SwiftUI

struct PostListView: View {
    // デフォルトの分割線を削除
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    // NavigationLink： 対象ページ
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    // .hidden 効くない
                    .opacity(0)
                }
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView()
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
