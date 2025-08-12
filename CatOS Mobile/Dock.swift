//
//  Dock.swift
//  CatOS Mobile
//
//  Created by Daniel on 11/8/2025.
//

import SwiftUI

struct Dock: View {
    @Binding var name : [String]
    @Binding var iconName : [String]
    
    var body: some View {
        ZStack{
            Image("iPhone-OS-4.0-Dock_resized")
                .resizable()
                .scaledToFit()
            
            HStack{
                ForEach(0..<name.count){ value in
                    Group{
                        Image(iconName[value])
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipped()
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        Gradient.Stop(color: .clear, location: 0),
                                        Gradient.Stop(color: .clear, location: 0.50),
                                        Gradient.Stop(color: Color.white.opacity(0.6), location: 1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .rotationEffect(.degrees(-180))
                            .offset(y: 30)
                            .rotation3DEffect(.degrees(-180), axis: (x: 0, y: 1, z: 0))
                    }.padding(.trailing)
                }
            }
            
            HStack{
                ForEach(0..<name.count){ value in
                    Group{
                        VStack{
                            Image(iconName[value])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                            
                            Text(name[value])
                                .foregroundColor(.white)
                                .shadow(radius: 6)
                        }
                    }
                    .padding(.trailing)
                    .font(.system(size: 15))
                }
            }
            .frame(height: 40)
            .offset(y: -20)
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview{
    HomeView()
}
