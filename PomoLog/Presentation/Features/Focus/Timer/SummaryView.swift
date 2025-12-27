//
//  SummaryView.swift
//  PomoLog
//
//  Created by APPLE on 12/26/25.
//

import SwiftUI

import RealmSwift

struct SummaryView: View {
    
    @State var summary: String = ""
    @ObservedObject var timerManager: TimerManager
    
    let pomodoroID: ObjectId
    
    var body: some View {
        HStack(spacing: 16) {
            TextField("어떤 일을 수행하셨나요?", text: $summary)
                .textFieldStyle(.roundedBorder)
                .frame(height: 40)
            
            Button {
                timerManager.focusStep = PomodoroSchedular.shared.getNextStep()
                timerManager.remainingTime = timerManager.focusStep.totalTime
                saveSummary()
            } label: {
                HStack {
                    Text("완료하기")
                        .font(.customSemiBold(ofSize: 14))
                }
                .padding(.vertical, 4)
                .frame(width: 80)
                .background(summary.isEmpty ? .gray : .enableStart)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .foregroundColor(.white)
            }
            .buttonStyle(PlainButtonStyle())
            .shadow(radius: 1)
            .disabled(summary.isEmpty)
            .frame(height: 40)
        }
        .frame(width: 500)
    }
}

extension SummaryView {
    
    private func saveSummary() {
        let realmManager = PomodoroRealmManager()
        
        let summaryModel = SummaryModel()
        summaryModel.content = summary
        
        let isSaved = realmManager.save(model: summaryModel)
        
        if isSaved {
            guard let fetchedPomodoroModel = realmManager.fetchById(id: pomodoroID, PomodoroModel.self) else {
                return
            }
            let _ = realmManager.update(model: fetchedPomodoroModel) {
                fetchedPomodoroModel.summaries.append(summaryModel)
            }
            initSummary()
        }
    }
    
    private func initSummary() {
        summary = ""
    }
}
