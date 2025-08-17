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
    
    
    let UtilitiesLine1AppNameList : [String] = ["時鐘","計算機","指南針","錄音機"]
    let UtilitiesLine1AppIconList : [String] = ["Clock","Calcualator","Compass","Voice Memos"]
    
    
    
    @State var showUtilitiesFolder : Bool = false
    
    var body: some View {
        VStack(spacing: -10){
            HStack{
                ForEach(0..<Line1AppNameList.count){ v in
                    @State var AppName : String = Line1AppNameList[v]
                    @State var AppIcon : String = Line1AppIconList[v]
                    
                    if showUtilitiesFolder{
                        
                        if Line1AppNameList[v] == "工具程式"{
                            Icons(name: $AppName, iconName: $AppIcon)
                        }else{
                            Icons(name: $AppName, iconName: $AppIcon)
                                .opacity(0.4)
                        }
                        
                    }else{
                        Icons(name: $AppName, iconName: $AppIcon)
                    }
                    
                }
            }
            
            ZStack{
                
                HStack{
                    ForEach(0..<Line2AppNameList.count){ v in
                        @State var AppName : String = Line2AppNameList[v]
                        @State var AppIcon : String = Line2AppIconList[v]
                        
                        if showUtilitiesFolder{
                            
                            if Line2AppNameList[v] == "工具程式"{
                                Icons(name: $AppName, iconName: $AppIcon)
                            }else{
                                Icons(name: $AppName, iconName: $AppIcon)
                                    .opacity(0.4)
                            }
                            
                        }else{
                            Icons(name: $AppName, iconName: $AppIcon)
                        }
                        
                    }
                }
                
                
                if showUtilitiesFolder{
                    
                    VStack(spacing: -30){
                        HStack{
                            Text("工具程式")
                                .font(.title.bold())
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }.padding()
                        
                        
                        VStack{
                            
                            HStack(){
                                ForEach(0..<UtilitiesLine1AppIconList.count){ v in
                                    @State var AppName : String = UtilitiesLine1AppNameList[v]
                                    @State var AppIcon : String = UtilitiesLine1AppIconList[v]
                                    
                                    Icons(name: $AppName, iconName: $AppIcon)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                        }.offset(y: 25)
                        
                        Spacer()
                        
                    }
                    .padding(.vertical)
                    .frame(height: 200)
                    .frame(height: 0)
                    .frame(width: UIScreen.main.bounds.width)
                    .background{
                        Image("app_folder_bg")
                            .frame(height: 160)
                            .frame(width: UIScreen.main.bounds.width)
                            .mask{
                                Rectangle()
                                
                                Image(systemName: "triangleshape.fill")
                                    .resizable()
                                    .frame(width: 50,height: 30)
                                    .rotationEffect(.degrees(180))
                                    .offset(x: -45,y: 80)
                            }
                        
                        
                    }
                    .offset(y: -50)
                    
                }
            }
            
            HStack{
                ForEach(0..<Line3AppNameList.count){ v in
                    @State var AppName : String = Line3AppNameList[v]
                    @State var AppIcon : String = Line3AppIconList[v]
                    
                    
                    if showUtilitiesFolder{
                        
                        if Line3AppNameList[v] == "工具程式"{
                            Icons(name: $AppName, iconName: $AppIcon)
                        }else{
                            Icons(name: $AppName, iconName: $AppIcon)
                                .opacity(0.4)
                        }
                        
                    }else{
                        Icons(name: $AppName, iconName: $AppIcon)
                            .onTapGesture {
                                if Line3AppNameList[v] == "工具程式"{
                                    showUtilitiesFolder = true
                                }
                            }
                    }
                    
                    
                }
            }
            
            HStack{
                ForEach(0..<Line4AppNameList.count){ v in
                    @State var AppName : String = Line4AppNameList[v]
                    @State var AppIcon : String = Line4AppIconList[v]
                    
                    if showUtilitiesFolder{
                        
                        if Line4AppNameList[v] == "工具程式"{
                            Icons(name: $AppName, iconName: $AppIcon)
                        }else{
                            Icons(name: $AppName, iconName: $AppIcon)
                                .opacity(0.4)
                        }
                        
                    }else{
                        Icons(name: $AppName, iconName: $AppIcon)
                    }
                }
            }
        }
        .padding()
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            if showUtilitiesFolder{
                showUtilitiesFolder = false
            }
        }
    }
}

#Preview {
    HomeViewPage1()
}
