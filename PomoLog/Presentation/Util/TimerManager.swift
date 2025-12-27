//
//  TimerManager.swift
//  PomoLog
//
//  Created by APPLE on 12/26/25.
//

import Combine
import SwiftUI

import RealmSwift

final class TimerManager: ObservableObject {
    
    @Published var focusStep: FocusStep = .focus
    @Published var cycle: Cycle = .first
    @Published var remainingTime: Int = FocusStep.focus.totalTime
    @Published var isEnabled: Bool = false
    
    private var timer: Timer?
    private let pomodoroID: ObjectId
    
    init(pomodoroID: ObjectId) {
        self.pomodoroID = pomodoroID
    }
    
    func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            
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
    
    func stopTimer() {
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
}
