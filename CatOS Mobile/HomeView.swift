//
//  HomeView.swift
//  CatOS Mobile
//
//  Created by Daniel on 10/8/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var offsetValue : CGFloat = 0
    
    @State private var UnLookOffsetValue : CGFloat = 0
    
    @State private var UnLook : Bool = false
    
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
    
    var body: some View {
        VStack{
            
            VStack(spacing: 0){
                
                HStack{
                    Text("沒有服務")
                        .padding(.leading)
                    
                    Image(systemName: "wifi")
                    
                    Spacer()
                    
                    Image(systemName: "lock.fill")
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
                
                VStack(spacing: -30){
                    HStack{
                        Group{
                            VStack{
                                Image("Messages")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("信息")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            
                            VStack{
                                ZStack{
                                    
                                    Image("Calendar")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70)
                                    
                                    
                                    Text(WeekDay)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        .offset(y:-25)
                                        .shadow(radius: 6)
                                    
                                    Text(day)
                                        .font(.system(size:40))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        .offset(y:8)
                                    
                                }
                                
                                Text("日曆")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("Photos")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("相片")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("Camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("相機")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                                    .frame(width: 40)
                            }
                        }
                        .padding(.trailing)
                        .font(.system(size: 15))
                    }
                    .padding()
                    
                    HStack{
                        Group{
                            VStack{
                                Image("YouTube")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("YouTube")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            
                            VStack{
                                Image("Stocks")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("股市")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("Maps")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("地圖")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("Weather Celsius")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("天氣")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                                    .frame(width: 40)
                            }
                        }
                        .padding(.trailing)
                        .font(.system(size: 15))
                    }
                    .padding(.horizontal)
                    
                    
                    HStack{
                        Group{
                            VStack{
                                Image("Notes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("備忘錄")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            
                            VStack{
                                Image("Utilities")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("工具程式")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("iTunes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("iTunes")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("App Store")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("App Store")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                                    .frame(width: 70)
                            }
                        }
                        .padding(.trailing)
                        .font(.system(size: 15))
                    }
                    .padding(.horizontal)
                    
                    
                    HStack{
                        Group{
                            VStack{
                                Image("Settings")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("設定")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            Spacer()
                        }
                        .padding(.trailing)
                        .font(.system(size: 15))
                    }
                    .padding(.horizontal)
                }
                
                
                Spacer()
                
                 
                VStack{
                    HStack{
                        Group{
                            VStack{
                                Image("Phone")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("電話")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            
                            VStack{
                                Image("Mail")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("郵件")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("Safari")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("Safari")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                            }
                            
                            VStack{
                                Image("iPod")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                
                                Text("iPod")
                                    .padding(.vertical)
                                    .offset(y:-25)
                                    .foregroundColor(.white)
                                    .shadow(radius: 6)
                                    .frame(width: 40)
                            }
                        }
                        .padding(.trailing)
                        .font(.system(size: 15))
                    }
                    .frame(height: 70)
                }
                .frame(width: UIScreen.main.bounds.width - 46)
                .background{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .rotation3DEffect(.degrees(55), axis: (x: 1, y: 0, z: 0))
                }
                .padding(.horizontal,24)
                .offset(y: 39)
                 
                Spacer()

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Image("bg")
                    .resizable()
            }
            .animation(.easeInOut, value: offsetValue)
            .onAppear{
                UIDevice.current.isBatteryMonitoringEnabled = true
            }
        }
    }
}

#Preview {
    HomeView()
}

