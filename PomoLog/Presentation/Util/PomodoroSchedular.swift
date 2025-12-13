//
//  PomodoroSchedular.swift
//  PomoLog
//
//  Created by APPLE on 12/9/25.
//

final class PomodoroSchedular {
    
    static let shared = PomodoroSchedular()
    
    private init() {}
    
    private let initValue = 0
    private let maxCount = 4
    private let step = 1
    
    private(set) var focusCounter = 1
    private(set) var focusSummaryCounter = 0
    private(set) lazy var shortBreakCounter = initValue
    
    func getNextStep() -> FocusStep {
        if focusSummaryCounter == maxCount {
            initCounter()
            return .longBreak
        }
        
        if focusCounter > focusSummaryCounter {
            increaseFocusSummaryCounter()
            return .focusSummary
        }
        
        if focusSummaryCounter > shortBreakCounter {
            increaseShortBreakCounter()
            return .shortBreak
        }
        
        increaseFocusCounter()
        return .focus
    }
    
    private func initCounter() {
        focusCounter = initValue
        focusSummaryCounter = initValue
        shortBreakCounter = initValue
    }
    
    private func increaseFocusCounter() {
        focusCounter += step
    }
    
    private func increaseFocusSummaryCounter() {
        focusSummaryCounter += step
    }
    
    private func increaseShortBreakCounter() {
        shortBreakCounter += step
    }
}
