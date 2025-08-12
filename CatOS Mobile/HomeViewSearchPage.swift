//
//  HomeViewSearchPage.swift
//  CatOS Mobile
//
//  Created by Daniel on 11/8/2025.
//

import SwiftUI

struct HomeViewSearchPage: View {
    let AppNameList : [String] = ["信息","日曆","圖片","相機","YouTube","股市","地圖","天氣","備忘錄","iTunes","App Store","設定"]
    let AppIconList : [String] = ["Messages","Calendar","Photos","Camera","YouTube","Stocks","Maps","Weather Celsius","Notes","iTunes","App Store","Settings"]
    
    let AppEngNameList : [String] = ["Messages","Calendar","Photos","Camera","YouTube","Stocks","Maps","Weather","Notes","iTunes","App Store","Settings"]
    
    @State var searchResult : [String] = []
    @State var searchResultAppIcon : [String] = []
    
    
    @State private var searchText = ""
    @FocusState var focusedTextField : Bool
    @State var showListBg : Bool = false
    
    
    var body: some View {
        VStack {
            // 搜索框
            TextField("搜尋",text: $searchText)
                .colorScheme(.light)
                .focused($focusedTextField)
                .textFieldStyle(.plain)
                .frame(maxWidth: .infinity)
                .padding(5)
                .padding(.horizontal,30)
                .background(Capsule().fill(.white))
                .padding(.horizontal)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .frame(maxWidth: .infinity,alignment:.leading)
                        .padding(25)
                        .foregroundColor(Color(.secondaryLabel))
                        .colorScheme(.light)
                )
                .onSubmit { focusedTextField = false }
                .onChange(of: searchText){
                    searchResult = []
                    searchResultAppIcon = []

                    for index in 0..<AppNameList.count{
                        if AppNameList[index].containsIgnoringCase(searchText){
                            searchResult.append(AppNameList[index])
                            searchResultAppIcon.append(AppIconList[index])
                        }else if AppEngNameList[index].containsIgnoringCase(searchText){
                            searchResult.append(AppNameList[index])
                            searchResultAppIcon.append(AppIconList[index])
                        }
                    }
                    
                    if searchText == "" || searchResult == []{
                        showListBg = false
                    }else{
                        showListBg = true
                    }
                }
                .padding(.vertical)
                .submitLabel(.search)
            
            // 列表（关键修改：限制最大高度为剩余空间）
            List {
                ForEach(0..<searchResult.count, id: \.self) { index in
                    ZStack{
                        
                        if index % 2 == 0{
                            Color(red: 229/255, green: 229/255, blue: 229/255)
                        }else{
                            Color(red: 206/255, green: 209/255, blue: 212/255)
                        }
                        
                        HStack{
                            Image(searchResultAppIcon[index])
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.horizontal)
                                .padding(.vertical,8)
                            
                            Divider()
                            
                            Text(searchResult[index])
                            
                            Spacer()
                        }.padding(.leading)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .overlay(
                        Rectangle()
                            .frame(height: 0.4) // 设置边框高度
                            .foregroundColor(.black) // 设置边框颜色
                            .padding(.top, 35) // 调整位置，确保边框在底部
                        , alignment: .bottom
                    )
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(Color.clear)
            }
            .cornerRadius(20)
            .listStyle(.plain)
            .background{
                if showListBg {
                    Color(red: 229/255, green: 229/255, blue: 229/255)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)
            .padding(.bottom,80)
            .colorScheme(.light)
            .frame(maxHeight: .infinity) // 限制列表高度为剩余空间
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    HomeViewSearchPage()
}


