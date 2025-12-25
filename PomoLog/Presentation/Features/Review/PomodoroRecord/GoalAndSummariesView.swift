//
//  GoalAndSummaryView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

import RealmSwift

struct GoalAndSummariesView: View {
    
    let goal: String
    let summaries: RealmSwift.List<SummaryModel>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            GoalView(goal: goal)
            SummariesView(summaries: summaries)
        }
        .padding(.top, 8)
    }
}
