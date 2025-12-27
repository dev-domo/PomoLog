//
//  TimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import Combine
import SwiftUI

import RealmSwift

struct TimerView: View {
        
    private let seconds: Int = 60
    private let timerFormat: String = "%02d:%02d"
    
    @ObservedObject var timerManager: TimerManager
    let selectTabAction: (Int) -> Void
    let pomodoroID: ObjectId

    init(
        timerManager: TimerManager,
        selectTabAction: @escaping (Int) -> Void,
        pomodoroID: ObjectId
    ) {
        self.timerManager = timerManager
        self.selectTabAction = selectTabAction
        self.pomodoroID = pomodoroID
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(timerManager.focusStep.title)
                    .font(.customSemiBold(ofSize: 20))
                    .foregroundStyle(timerManager.focusStep.color)
            }
            
            VStack {
                Text(formatTime(timerManager.remainingTime))
                    .font(.customExtraBold(ofSize: 60))
                    .foregroundStyle(timerManager.focusStep.color)
            }
            .padding(.vertical, 30)
            
            if !timerManager.isEnabled {
                TimerButton(
                    action: { timerManager.startTimer() },
                    image: .play,
                    color: timerManager.focusStep.color
                )
            } else {
                if timerManager.focusStep == .focusSummary {
                    SummaryView(
                        timerManager: timerManager,
                        pomodoroID: pomodoroID
                    )
                } else {
                    StopTimerView(
                        timerManager: timerManager, 
                        pomodoroID: pomodoroID,
                        selectTabAction: selectTabAction
                    )
                }
            }
        }
        .frame(minWidth: 600, alignment: .center)
    }
}

extension TimerView {
    
    private func formatTime(_ time: Int) -> String {
        let minutes = time / seconds
        let seconds = time % seconds
        return String(format: timerFormat, minutes, seconds)
    }
}
