//
//  HomeView.swift
//  Restart
//
//  Created by Marcel Felipe Gottardi Anesi on 19/03/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            headerView
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            footerView
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

// MARK: - Layout
extension HomeView {
    
    var headerView: some View {
        ZStack {
            CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
            
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                    , value: isAnimating
                )
        }
    }
    
    var footerView: some View {
        Button(action: {
            withAnimation {
                AudioPlayer.playSound(sound: "success", type: "m4a")
                isOnboardingViewActive = true
            }
        }) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            
            Text("Restart")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
    }
    
}

#Preview {
    HomeView()
}
