//
//  PomodoroTimerview.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct PomodoroTimerView: View {
    
    @State var cycle: Cycle
    @State var focusStep: FocusStep
    let selectTabAction: (Int) -> Void
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                ProgressBarView(cycle: $cycle)
                FocusStepView(focusStep: $focusStep)
                TimerView(
                    cycle: $cycle,
                    focusStep: $focusStep,
                    selectTabAction: selectTabAction
                )
            }
        }
    }
}

#Preview {
    PomodoroTimerView(
        cycle: .first,
        focusStep: .focus) { _ in
            print()
        }
}
