//
//  PomodoroTimerview.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

import RealmSwift

struct PomodoroTimerView: View {
    
    @State var cycle: Cycle
    @State var focusStep: FocusStep
    @State var showPopUp: Bool = false
    let goal: String
    let selectTabAction: (Int) -> Void
    let pomodoroID: ObjectId
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ZStack {
                VStack {
                    HStack {
                        ProgressBarView(cycle: $cycle, goal: goal)
                        QuestionMarkView(showPopUp: $showPopUp, goal: goal)
                    }
                    FocusStepView(focusStep: $focusStep)
                    TimerView(
                        cycle: $cycle,
                        focusStep: $focusStep,
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
