//
//  HomeViewPage1.swift
//  CatOS Mobile
//
//  Created by Daniel on 11/8/2025.
//

import SwiftUI

struct HomeViewPage2: View {
    let Line1AppNameList : [String] = ["通訊錄","Placeholder","Placeholder","Placeholder"]
    let Line1AppIconList : [String] = ["Contacts","Placeholder","Placeholder","Placeholder"]
    
    let Line2AppNameList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    let Line2AppIconList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    
    let Line3AppNameList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    let Line3AppIconList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    
    let Line4AppNameList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    let Line4AppIconList : [String] = ["Placeholder","Placeholder","Placeholder","Placeholder"]
    
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
    HomeViewPage2()
}
