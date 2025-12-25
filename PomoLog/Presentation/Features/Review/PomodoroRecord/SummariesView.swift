//
//  SummariesView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

import RealmSwift

struct SummariesView: View {
    
    private let item: String = "·"
    private let none: String = "-"
    
    let summaries: RealmSwift.List<SummaryModel>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("요약", systemImage: "doc.text.fill")
                .font(.customSemiBold(ofSize: 14))
                .foregroundStyle(.secondary)
            
            if summaries.isEmpty {
                Text(none)
                    .font(.customMedium(ofSize: 14))
                    .foregroundStyle(.tertiary)
                    .padding(.leading, 4)
            } else {
                ForEach(summaries, id: \.self) { summary in
                    HStack(alignment: .top, spacing: 6) {
                        Text(item)
                        Text(summary.content)
                    }
                    .font(.customMedium(ofSize: 14))
                    .foregroundStyle(.primary)
                    .padding(.leading, 4)
                }
            }
        }
    }
}
