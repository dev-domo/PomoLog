//
//  ContentView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct BottomTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("타이머")
                }
            
            ReviewView()
                .tabItem {
                    Image(systemName: "book")
                    Text("돌아보기")
                }
        }
    }
}

#Preview {
    BottomTabView()
}
