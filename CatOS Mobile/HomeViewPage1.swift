//
//  HomeViewPage1.swift
//  CatOS Mobile
//
//  Created by Daniel on 11/8/2025.
//

import SwiftUI

struct HomeViewPage1: View {
    let Line1AppNameList : [String] = ["信息","日曆","圖片","相機"]
    let Line1AppIconList : [String] = ["Messages","Calendar","Photos","Camera"]
    
    let Line2AppNameList : [String] = ["YouTube","股市","地圖","天氣"]
    let Line2AppIconList : [String] = ["YouTube","Stocks","Maps","Weather Celsius"]
    
    let Line3AppNameList : [String] = ["備忘錄","工具程式","iTunes","App Store"]
    let Line3AppIconList : [String] = ["Notes","Utilities","iTunes","App Store"]
    
    let Line4AppNameList : [String] = ["設定","Placeholder","Placeholder","Placeholder"]
    let Line4AppIconList : [String] = ["Settings","Placeholder","Placeholder","Placeholder"]
    
    var body: some View {
        VStack(spacing: -10){
            HStack{
                ForEach(0..<Line1AppNameList.count){ v in
                    @State var AppName : String = Line1AppNameList[v]
                    @State var AppIcon : String = Line1AppIconList[v]
                    
                    Icons(name: $AppName, iconName: $AppIcon)
                }
            }
            
            HStack{
                ForEach(0..<Line2AppNameList.count){ v in
                    @State var AppName : String = Line2AppNameList[v]
                    @State var AppIcon : String = Line2AppIconList[v]
                    
                    Icons(name: $AppName, iconName: $AppIcon)
                }
            }
            
            HStack{
                ForEach(0..<Line3AppNameList.count){ v in
                    @State var AppName : String = Line3AppNameList[v]
                    @State var AppIcon : String = Line3AppIconList[v]
                    
                    Icons(name: $AppName, iconName: $AppIcon)
                }
            }
            
            HStack{
                ForEach(0..<Line4AppNameList.count){ v in
                    @State var AppName : String = Line4AppNameList[v]
                    @State var AppIcon : String = Line4AppIconList[v]
                    
                    Icons(name: $AppName, iconName: $AppIcon)
                }
            }
        }
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    HomeViewPage1()
}
