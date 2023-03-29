//
//  PostListView.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/24.
//

import SwiftUI

struct PostListView: View {
    let category: PostListCategory
    
    var postList: PostList {
        switch category {
        case .recommend:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
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
            PostListView(category: .recommend)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
