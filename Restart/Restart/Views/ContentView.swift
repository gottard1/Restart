//
//  ContentView.swift
//  Restart
//
//  Created by Marcel Felipe Gottardi Anesi on 19/03/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView(isOnboardingViewActive: true)
}
