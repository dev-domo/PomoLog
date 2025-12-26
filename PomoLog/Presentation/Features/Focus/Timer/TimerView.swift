//
//  TimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

import RealmSwift

struct TimerView: View {
    
    private let seconds: Int = 60
    private let timerFormat: String = "%02d:%02d"
    
    @Binding var cycle: Cycle
    @Binding var focusStep: FocusStep
    @State var remainingTime: Int
    let selectTabAction: (Int) -> Void
    let pomodoroID: ObjectId
    
    @State var timer: Timer?
    @State var isEnabled: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text(focusStep.title)
                    .font(.customSemiBold(ofSize: 20))
                    .foregroundStyle(focusStep.color)
            }
            
            VStack {
                Text(formatTime(remainingTime))
                    .font(.customExtraBold(ofSize: 60))
                    .foregroundStyle(focusStep.color)
            }
            .padding(.vertical, 30)
            
            if !isEnabled {
                TimerButton(
                    action: { startTimer() },
                    image: .play
                )
            } else {
                if focusStep == .focusSummary {
                    SummaryView(
                        focusStep: $focusStep,
                        remainingTime: $remainingTime,
                        pomodoroID: pomodoroID
                    )
                } else {
                    StopTimerView(
                        focusStep: $focusStep,
                        remainingTime: $remainingTime,
                        isEnabled: $isEnabled,
                        timer: $timer,
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
    
    private func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            isEnabled = true
            
            if remainingTime > 0 {
                remainingTime -= 1
                return
            }
            
            focusStep = PomodoroSchedular.shared.getNextStep()
            remainingTime = focusStep.totalTime
            
            if focusStep == .focus {
                cycle = cycle.update()
            }
            if focusStep == .focusSummary {
                updateFocusTime()
            }
        }
    }
    
    private func stopTimer() {
        isEnabled = false
        timer?.invalidate()
        timer = nil
    }
    
    private func updateFocusTime() {
        let realmManager = PomodoroRealmManager()
        
        guard let fetchedPomodoroModel = realmManager.fetchById(id: pomodoroID, PomodoroModel.self) else {
            return
        }
        
        let _ = realmManager.update(model: fetchedPomodoroModel) {
            fetchedPomodoroModel.focusTime += FocusStep.focusTime
        }
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
