//
//  StopTimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/26/25.
//

import SwiftUI

import RealmSwift

struct StopTimerView: View {
    
    @Binding var focusStep: FocusStep
    @Binding var remainingTime: Int
    @Binding var isEnabled: Bool
    @Binding var timer: Timer?
    let pomodoroID: ObjectId
    let selectTabAction: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            TimerButton(
                action: { stopTimer() },
                image: .pause
            )
            
            TimerButton(
                action: {
                    stopTimer()
                    if focusStep == .focus {
                        updateFocusTime(remainingTime: remainingTime)
                    }
                    selectTabAction(1)
                },
                image: .stop
            )
        }
    }
}

extension StopTimerView {
    
    private func stopTimer() {
        isEnabled = false
        timer?.invalidate()
        timer = nil
    }
    
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
