//
//  PomodoroCardView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

struct PomodoroCardView: View {
    
    let index: Int
    let pomodoro: PomodoroModel
    let formattedTime: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PomodoroCardHeaderView(
                index: index,
                formattedTime: formattedTime
            )
            
            GoalAndSummariesView(
                goal: pomodoro.goal,
                summaries: pomodoro.summaries
            )
            .padding([.horizontal, .bottom], 16)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}
