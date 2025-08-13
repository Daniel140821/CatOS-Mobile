//
//  HomeView.swift
//  CatOS Mobile
//
//  Created by Daniel on 10/8/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pages : Int? = 1
    
    let weekdayList : [String] = ["日","一","二","三","四","五","六"]
    
    let calendar = Calendar.current
    
    var time: String {
        let hour = "\(calendar.component(.hour, from: Date()) < 10 ? "0" : "")\(calendar.component(.hour, from: Date()))"
        let min = "\(calendar.component(.minute, from: Date()) < 10 ? "0" : "")\(calendar.component(.minute, from: Date()))"
        return "\(hour):\(min)"
    }
    
    var date: String {
        let month = calendar.component(.month, from: Date())
        let day = calendar.component(.day, from: Date())
        return "\(month)月\(day)日"
    }
    
    var day: String {
        let day = calendar.component(.day, from: Date())
        return "\(day)"
    }
    
    var month: String {
        let month = calendar.component(.month, from: Date())
        return "\(month)"
    }
    
    var WeekDay: String {
        let weekday = calendar.component(.weekday, from: Date())
        let weekdayString = weekdayList[weekday - 1]
        return "星期\(weekdayString)"
    }
    
    var batteryLevel : Int{
        Int(UIDevice.current.batteryLevel * 100)
    }
    
    var isCharging : Bool{
        // 获取电池状态
            let batteryState = UIDevice.current.batteryState
            
            // 状态说明：
            // .unplugged：未充电
            // .charging：正在充电（未充满）
            // .full：已充满（仍在充电）
            // .unknown：无法获取状态（通常是未开启监控）
            return batteryState == .charging || batteryState == .full
    }
    
    @State var DockAppNameList : [String] = ["電話","郵件","Safari","iPod"]
    @State var DockAppIconList : [String] = ["Phone","Mail","Safari","iPod"]
    
    var body: some View {
        ZStack{
            
            Image("bg")
                .resizable()
            
            VStack{
                
                VStack(spacing: 0){
                    
                    HStack{
                        Text("沒有服務")
                            .padding(.leading)
                        
                        Image(systemName: "wifi")
                        
                        Spacer()
                        
                        Text(time)
                            .padding(5)
                        
                        Spacer()
                        
                        Text("\(batteryLevel)%")
                        
                        
                        // 根据充电状态和电量显示对应图标
                        Group {
                            if isCharging {
                                Image(systemName: "battery.100percent.bolt")
                            } else {
                                switch batteryLevel {
                                case 100:
                                    Image(systemName: "battery.100percent")
                                case 75...99:
                                    Image(systemName: "battery.75percent")
                                case 50...74:
                                    Image(systemName: "battery.50percent") // 修复原代码中此处误用75%图标的问题
                                case 25...49:
                                    Image(systemName: "battery.25percent")
                                case 0...24:
                                    Image(systemName: "battery.0percent")
                                default:
                                    Image(systemName: "battery.0percent") // 使用更准确的未知状态图标
                                }
                            }
                        }
                        .padding(.trailing) // 将重复的padding提取到外层，避免代码冗余
                        
                    }
                    .frame(maxWidth: .infinity)
                    .background{
                        Rectangle()
                            .fill(.black.opacity(0.7))
                    }
                    .foregroundColor(.white)
                    
                    // 修改HomeView.swift中的ScrollView设置
                    GeometryReader{ geo in
                        ScrollViewReader{ proxy in
                            ScrollView(.horizontal) {
                                HStack(spacing: 0) {
                                    Group{
                                        HomeViewSearchPage()
                                            .id(0)
                                        HomeViewPage1()
                                            .id(1)
                                        HomeViewPage2()
                                            .id(2)
                                    }
                                    .frame(width: geo.size.width, height: geo.size.height)
                                    // 移除子视图的 ignoresSafeArea(.keyboard)
                                }
                            }
                            .scrollTargetLayout()
                            .scrollPosition(id: $pages)
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.paging)
                            .frame(maxWidth: .infinity,maxHeight: .infinity)
                            .background{
                                if pages == 0{
                                    Color.black.opacity(0.7).ignoresSafeArea()
                                }
                            }
                            .onAppear { proxy.scrollTo(1, anchor: .leading) }
                        }
                    }
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(pages == 0 ? Color(.white) : Color(.secondaryLabel))
                            .font(.system(size: 15))
                        
                        Image(systemName: "circle.fill")
                            .foregroundColor(pages == 1 ? Color(.white) : pages == 0 ? Color(.white).opacity(0.4) : Color(.secondaryLabel))
                        
                        Image(systemName: "circle.fill")
                            .foregroundColor(pages == 2 ? Color(.white) : pages == 0 ? Color(.white).opacity(0.4) : Color(.secondaryLabel))
                        
                    }
                    .font(.system(size: 10))
                    .offset(y: -60)
                    .bold()
                    .frame(width: 0, height: 0)
                    
                    
                    
                    Dock(name: $DockAppNameList, iconName: $DockAppIconList)
                        .offset(y: 7)
                        .background{
                            if pages == 0{
                                Color.black.opacity(0.7)
                                    .ignoresSafeArea()
                                    .frame(height: 81)
                            }
                        }
                        
                    
                    
                }
            }
            .onAppear{
                pages = 1
                
                UIDevice.current.isBatteryMonitoringEnabled = true
            }
            
        }//.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    HomeView()
}

