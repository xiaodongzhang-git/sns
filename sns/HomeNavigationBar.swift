//
//  HomeNavigationBar.swift
//  sns
//
//  Created by xiaodong zhang on 2023/03/28.
//

import SwiftUI

private let KLabelWidth: CGFloat = 60
private let KButtonHeight: CGFloat = 24
private let KWidth: CGFloat = UIScreen.main.bounds.width * 0.5

struct HomeNavigationBar: View {
    // @State プロパティを変更でき、ビューが更新されることを示します。
    @State var leftPercent: CGFloat // 0 for left, 1 for right
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("Click camera button")
            }){
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: KLabelWidth, height: KButtonHeight)
                    .padding(.top, 5)
                    .padding(.horizontal, 15)
                    .foregroundColor(.black)
                
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("勧め")
                        .bold()
                        .frame(width: KLabelWidth, height: KButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("人気")
                        .bold()
                        .frame(width: KLabelWidth, height: KButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 1
                            }
                        }
                }
                .font(.system(size: 20))
                
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 4)
                    .offset(x: KWidth * (self.leftPercent - 0.5) + KLabelWidth * (0.5 - self.leftPercent))
            }
            .frame(width: KWidth)
            
            Spacer()
            
            Button(action: {
                print("Click add button")
            }){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: KLabelWidth, height: KButtonHeight)
                    .padding(.top, 5)
                    .padding(.horizontal, 15)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 1)
    }
}
