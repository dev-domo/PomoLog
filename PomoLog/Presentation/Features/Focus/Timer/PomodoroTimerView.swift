//
//  PomodoroTimerview.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

import RealmSwift

struct PomodoroTimerView: View {
    
    @State var showPopUp: Bool = false
    @ObservedObject var timerManager: TimerManager
    
    let goal: String
    let selectTabAction: (Int) -> Void
    let pomodoroID: ObjectId
    
    init(
        goal: String,
        selectTabAction: @escaping (Int) -> Void,
        pomodoroID: ObjectId
    ) {
        self.goal = goal
        self.selectTabAction = selectTabAction
        self.pomodoroID = pomodoroID
        self._timerManager = ObservedObject(wrappedValue: TimerManager(pomodoroID: pomodoroID))
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ZStack {
                VStack {
                    HStack {
                        ProgressBarView(timerManager: timerManager, goal: goal)
                        ExclamationMarkView(showPopUp: $showPopUp, goal: goal)
                    }
                    FocusStepView(timerManager: timerManager)
                    TimerView(
                        timerManager: timerManager,
                        selectTabAction: selectTabAction,
                        pomodoroID: pomodoroID
                    )
                }
                
                if showPopUp {
                    GoalPopUpView(
                        showPopUp: $showPopUp,
                        title: "목표",
                        message: goal,
                        buttonTitle: "확인"
                    )
                }
            }
        }
    }
}
