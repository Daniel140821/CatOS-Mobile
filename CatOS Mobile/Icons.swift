//
//  Icons.swift
//  CatOS Mobile
//
//  Created by Daniel on 11/8/2025.
//

import SwiftUI

struct Icons: View {
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
    
    
    @Binding var name : String
    @Binding var iconName : String
    
    var body: some View {
        if name != "日曆" && iconName != "Calendar" && name != "Placeholder" && iconName != "Placeholder"{
            VStack{
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                
                Text(name)
                    .padding(.vertical)
                    .offset(y:-25)
                    .foregroundColor(.white)
                    .shadow(radius: 6)
                    .frame(width: 80)
            }
        }else if name == "日曆" && iconName == "Calendar"{
            VStack{
                ZStack{
                    
                    Image("Calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                    
                    
                    Text(WeekDay)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(y:-23)
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
                    .frame(width: 80)
            }
        }else if name == "Placeholder" && iconName == "Placeholder"{
            VStack{
                Image("NoneIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                
                Text("　")
                    .padding(.vertical)
                    .offset(y:-25)
                    .foregroundColor(.white)
                    .shadow(radius: 6)
                    .frame(width: 80)
            }
        }
    }
}
