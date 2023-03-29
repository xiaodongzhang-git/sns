//
//  HomeView.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/29.
//

import SwiftUI

struct HomeView: View {
    // デフォルトの分割線を削除
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView() {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    PostListView(category: .recommend)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("home", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
