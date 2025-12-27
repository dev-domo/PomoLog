//
//  ContentView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct TopNavigationView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PomodoroGoalView(selectTabAction: { index in
                selectedTab = index
            })
            .tabItem {
                Text("타이머")
            }
            .tag(0)
            
            ReviewView(month: Date())
                .tabItem {
                    Text("돌아보기")
                }
                .tag(1)
        }
    }
}
