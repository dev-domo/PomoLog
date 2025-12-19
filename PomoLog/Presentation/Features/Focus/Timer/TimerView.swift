//
//  TimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

import RealmSwift

struct TimerView: View {
    
    private let seconds: Int = 60
    private let timerFormat: String = "%02d:%02d"
    
    @Binding var cycle: Cycle
    @Binding var focusStep: FocusStep
    @State var remainingTime: Int
    let selectTabAction: (Int) -> Void
    let pomodoroID: ObjectId
    
    @State var timer: Timer?
    @State var isEnabled: Bool = false
    @State var summary: String = ""
    
    init(
        cycle: Binding<Cycle>,
        focusStep: Binding<FocusStep>,
        selectTabAction: @escaping (Int) -> Void,
        pomodoroID: ObjectId
    ) {
        self._cycle = cycle
        self._focusStep = focusStep
        self._remainingTime = State(initialValue: focusStep.wrappedValue.totalTime)
        self.selectTabAction = selectTabAction
        self.pomodoroID = pomodoroID
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(focusStep.title)
                    .font(.customSemiBold(ofSize: 20))
                    .foregroundStyle(focusStep.color)
            }
            
            VStack {
                Text(formatTime(remainingTime))
                    .font(.customExtraBold(ofSize: 60))
                    .foregroundStyle(focusStep.color)
            }
            .padding(.vertical, 30)
            
            if !isEnabled {
                TimerButton(
                    action: { startTimer() },
                    imageName: "play.fill"
                )
            } else {
                if focusStep == .focusSummary {
                    HStack(spacing: 16) {
                        TextField("어떤 일을 수행하셨나요?", text: $summary)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 40)
                        
                        Button {
                            focusStep = PomodoroSchedular.shared.getNextStep()
                            remainingTime = focusStep.totalTime
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
                } else {
                    HStack(spacing: 16) {
                        TimerButton(
                            action: { stopTimer() },
                            imageName: "pause.fill"
                        )
                        
                        TimerButton(
                            action: {
                                stopTimer()
                                selectTabAction(1)
                            },
                            imageName: "stop.fill"
                        )
                    }
                }
            }
        }
        .frame(minWidth: 600, alignment: .center)
    }
    
    private func formatTime(_ time: Int) -> String {
        let minutes = time / seconds
        let seconds = time % seconds
        return String(format: timerFormat, minutes, seconds)
    }
    
    private func startTimer() {
        stopTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            isEnabled = true
            
            if remainingTime > 0 {
                remainingTime -= 1
                return
            }
            
            focusStep = PomodoroSchedular.shared.getNextStep()
            remainingTime = focusStep.totalTime
            
            if focusStep == .focus {
                cycle = cycle.update()
            }
        }
    }
    
    private func stopTimer() {
        isEnabled = false
        timer?.invalidate()
        timer = nil
    }
    
    private func saveSummary() {
        let realmManager = RealmManager()
        
        let summaryModel = SummaryModel()
        summaryModel.content = summary
        
        let isSaved = realmManager.save(model: summaryModel)
        
        if isSaved {
            guard let fetchedPomodoroModel = realmManager.fetchById(id: pomodoroID, PomodoroModel.self) else {
                return
            }
            
            let _ = realmManager.update(model: fetchedPomodoroModel) {
                fetchedPomodoroModel.summaries.append(summaryModel)
                fetchedPomodoroModel.focusTime += FocusStep.focusTime
            }
        }
    }
}
