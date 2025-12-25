//
//  GoalView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

struct GoalView: View {
    
    let goal: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("목표", systemImage: "target")
                .font(.customSemiBold(ofSize: 14))
                .foregroundStyle(.secondary)
            
            Text(goal.isEmpty ? "설정된 목표가 없습니다" : goal)
                .font(.customMedium(ofSize: 14))
                .padding(.leading, 4)
        }
    }
}
