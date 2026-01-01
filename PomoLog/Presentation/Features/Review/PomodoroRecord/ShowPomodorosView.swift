//
//  ShowPomodorsView.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import SwiftUI

import RealmSwift

struct ShowPomodorosView: View {
    
    private let secondsPerHour: Int = 3600
    private let secondsPerMinute: Int = 60
    private let hourUnit: String = "시간"
    private let minuteUnit: String = "분"
    private let secondUnit: String = "초"
    @State private var refreshID = UUID()
    
    let pomodoros: Results<PomodoroModel>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(Array(pomodoros.enumerated()), id: \.offset) { index, pomodoro in
                    PomodoroCardView(
                        index: index,
                        pomodoro: pomodoro,
                        formattedTime: formatTime(pomodoro.focusTime)) {
                            refreshID = UUID()
                        }
                }
            }
            .id(refreshID)
            .padding()
        }
        .background(.ultraThinMaterial)
    }
}

extension ShowPomodorosView {
    
    private func formatTime(_ totalSeconds: Int) -> String {
        let hours = totalSeconds / secondsPerHour
        let minutes = (totalSeconds % secondsPerHour) / secondsPerMinute
        let seconds = totalSeconds % secondsPerMinute
        
        var focusTime: [String] = []
        if hours > 0 {
            focusTime.append("\(hours)\(hourUnit)")
        }
        if minutes > 0 {
            focusTime.append("\(minutes)\(minuteUnit)")
        }
        if seconds > 0 {
            focusTime.append("\(seconds)\(secondUnit)")
        }
        
        return focusTime.joined(separator: " ")
    }
}
