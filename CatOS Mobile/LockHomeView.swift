//
//  LockHomeView.swift
//  CatOS Mobile
//
//  Created by Daniel on 9/8/2025.
//

import SwiftUI

struct LockHomeView: View {
    @State private var timer: Timer?
    
    @State private var TextEffect: Int?
    
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
    
    var WeekDay: String {
        let weekday = calendar.component(.weekday, from: Date())
        let weekdayString = weekdayList[weekday - 1]
        return "星期\(weekdayString)"
    }
    
    var batteryLevel : Int{
        Int(UIDevice.current.batteryLevel * 100)
    }
    
    var moded_battery_level : Int{
        abs(Int(batteryLevel/(100/16)))
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
        if UnLook{
            HomeView()
        }else{
            ZStack{
                if isCharging{
                    Rectangle()
                        .fill(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    
                    ZStack {
                        Color.black.edgesIgnoringSafeArea(.all)
                        Image("Battery_\(moded_battery_level)")
                            .clipped()
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        Gradient.Stop(color: .clear, location: 0),
                                        Gradient.Stop(color: .clear, location: 0.60),
                                        Gradient.Stop(color: Color.white.opacity(0.4), location: 1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .rotationEffect(.degrees(-180))
                            .offset(y: 129)
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        
                       Image("Battery_\(moded_battery_level)")
                    }
                }else{
                    Image("bg")
                        .resizable()
                }
                
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
                        
                        VStack{
                            
                            Text(time)
                                .font(.system(size: 70))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .padding(.top)
                            
                            Text("\(date)\(WeekDay)")
                                .foregroundColor(.white)
                                .padding(.bottom)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background{
                            VStack(spacing: 0){
                                Divider()
                                    .frame(height: 0.5) // 数值越大，线越粗
                                    .background(Color.gray)
                                Rectangle()
                                    .fill(Color(.secondaryLabel))
                                
                                Rectangle()
                                    .fill(.black.opacity(0.6))
                                Divider()
                                    .frame(height: 0.5) // 数值越大，线越粗
                                    .background(Color.gray)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(.systemGray3).gradient)
                                    .shadow(color:.white,radius: 0.5,y: 0.5)
                                    .frame(width: 80,height: 50)
                                    .padding(5)
                                
                                Image(systemName: "arrowshape.right.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:offsetValue)
                            .gesture(
                                DragGesture()
                                    .onEnded({ value in
                                        
                                        if offsetValue >= UnLookOffsetValue * 0.6{
                                            offsetValue = UnLookOffsetValue * 0.755
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                                                UnLook = true
                                            }
                                            playSound(sound: "ding", type: "mp3")
                                            
                                        }else{
                                            offsetValue = 0
                                        }
                                        
                                    })
                                    .onChanged { value in
                                        if value.translation.width > 0 && value.translation.width <= UnLookOffsetValue * 0.755{
                                            offsetValue = value.translation.width // 更新偏移量
                                        }
                                    }
                            )
                            
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background{
                            GeometryReader{ geo in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                                    .shadow(color:.white,radius: 0.5,y: 0.5)
                                    .onAppear{
                                        UnLookOffsetValue = geo.size.width
                                    }
                            }
                            
                            HStack{
                                Spacer()
                                    .frame(width: 80,height: 50)
                                
                                if offsetValue == 0{
                                    UnLockText
                                }
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background{
                        VStack(spacing: 0){
                            Rectangle()
                                .fill(Color(.secondaryLabel))
                            
                            Rectangle()
                                .fill(.black.opacity(0.6))
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .animation(.easeInOut, value: offsetValue)
                .onAppear{
                    UIDevice.current.isBatteryMonitoringEnabled = true
                    
                    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                        if TextEffect == 7{
                            TextEffect = 0
                        }else{
                            TextEffect = (TextEffect ?? 0) + 1
                        }
                    }
                    RunLoop.current.add(timer!, forMode: .common)
                }
            }
        }
    }
    
    var UnLockText : some View{
        LinearGradient(gradient: Gradient(colors: [TextEffect == 0 ? Color.white : Color(.secondaryLabel), TextEffect == 1 ? Color.white : Color(.secondaryLabel) , TextEffect == 2 ? Color.white : Color(.secondaryLabel) , TextEffect == 3 ? Color.white : Color(.secondaryLabel),TextEffect == 4 ? Color.white : Color(.secondaryLabel),TextEffect == 5 ? Color.white : Color(.secondaryLabel),TextEffect == 6 ? Color.white : Color(.secondaryLabel)]), startPoint: .leading, endPoint: .trailing)
            .mask{
                Text("移動滑桿來解鎖")
                    .font(.system(size: 32))
                    .padding(5)
                    .foregroundColor(.gray)
            }
    }
}

#Preview {
    LockHomeView()
}
