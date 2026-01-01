//
//  ContentView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

import RealmSwift

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    @StateObject private var timerManager = TimerManager(pomodoroID: ObjectId())
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PomodoroGoalView(
                selectTabAction: { index in
                    selectedTab = index
                },
                timerManager: timerManager)
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
        .onChange(of: selectedTab) { oldValue, newValue in
            if oldValue == 0 && newValue == 1 {
                timerManager.stopTimer()
            }
        }
    }
}
