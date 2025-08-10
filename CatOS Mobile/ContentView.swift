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
                Circle()
                    .opacity(0)
                    .frame(width: 70)
                    .ignoresSafeArea()
                    .onTapGesture {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .padding()
                
                
                LockHomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background()
                    .colorScheme(.light)
                    .padding(.vertical)
                
            }.ignoresSafeArea()
                
            ZStack{
                Circle()
                    .fill(.black.mix(with: .white, by: 0.2))
                    .frame(width: 70)
                    .ignoresSafeArea()
                    .onTapGesture {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                
                Image(systemName: "square")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.title)
            }.ignoresSafeArea()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
        }
        .statusBarHidden(true)
    }
}

#Preview {
    ContentView()
}
