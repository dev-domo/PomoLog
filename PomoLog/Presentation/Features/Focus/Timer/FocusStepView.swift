//
//  FocusStepView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct FocusStepView: View {
    
    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<3) { index in
                HStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .fill(
                                index <= timerManager.focusStep.rawValue ? timerManager.focusStep.color : .pomologLightGray
                            )
                            .frame(width: 20, height: 20)
                        
                        Text("\(index + 1)")
                            .font(.customMedium(ofSize: 10))
                            .foregroundStyle(.white)
                    }
                    
                    if index < 2 {
                        Rectangle()
                            .frame(width: 50, height: 2)
                            .foregroundStyle(
                                index <= timerManager.focusStep.rawValue ? timerManager.focusStep.color : .pomologLightGray
                            )
                    }
                }
            }
        }
        .padding(.vertical)
    }
}
