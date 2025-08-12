//
//  ContentView.swift
//  CatOS Mobile
//
//  Created by Daniel on 9/8/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            VStack{
                
                LockHomeView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
                    .background()
                    .colorScheme(.light)
                    .padding(.top)
                
            }
                
            ZStack{
                Circle()
                    .fill(.black.mix(with: .white, by: 0.2))
                    .frame(width: 70, height: 70)
                    .ignoresSafeArea()
                    .onTapGesture {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                
                Image(systemName: "square")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.title)
            }
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
        }
        .statusBarHidden(true)
        .colorScheme(.light)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ContentView()
}
