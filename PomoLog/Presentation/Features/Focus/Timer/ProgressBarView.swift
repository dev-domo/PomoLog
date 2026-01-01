//
//  ProgressBarView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct ProgressBarView: View {
    
    @State private var showPopUp: Bool = false
    @ObservedObject var timerManager: TimerManager
    
    let goal: String
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<Cycle.allCases.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 10)
                    .foregroundStyle(index <= timerManager.cycle.rawValue ? .gray : .lightGray)
            }
        }
        .padding(.vertical, 10)
    }
}
