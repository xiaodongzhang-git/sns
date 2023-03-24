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
    }
    
    var body: some View {
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
