//
//  StopTimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/26/25.
//

import SwiftUI

import RealmSwift

struct StopTimerView: View {
    
    @ObservedObject var timerManager: TimerManager
    
    let pomodoroID: ObjectId
    let selectTabAction: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            TimerButton(
                action: { timerManager.stopTimer() },
                image: .pause,
                color: timerManager.focusStep.color
            )
            
            TimerButton(
                action: {
                    timerManager.stopTimer()
                    PomodoroSchedular.shared.initCounter()
                    PomodoroSchedular.shared.increaseFocusCounter()
                    
                    if timerManager.focusStep == .focus {
                        updateFocusTime(remainingTime: timerManager.remainingTime)
                    }
                    selectTabAction(1)
                },
                image: .stop,
                color: timerManager.focusStep.color
            )
        }
    }
}

extension StopTimerView {
    
    private func updateFocusTime(remainingTime: Int) {
        let realmManager = PomodoroRealmManager()
        
        guard let fetchedPomodoroModel = realmManager.fetchById(id: pomodoroID, PomodoroModel.self) else {
            return
        }
        
        let _ = realmManager.update(model: fetchedPomodoroModel) {
            fetchedPomodoroModel.focusTime += FocusStep.focusTime - remainingTime
        }
    }
}
