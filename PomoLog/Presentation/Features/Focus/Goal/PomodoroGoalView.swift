//
//  GoalView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

import RealmSwift

struct PomodoroGoalView: View {
    
    let selectTabAction: (Int) -> Void
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        return formatter
    }()
    
    @State private var goal: String = ""
    @State private var csf: String = ""
    @State private var output: String = ""
    @State private var shouldNavigate: Bool = false
    @State private var pomodoroID: ObjectId = ObjectId()
    private var canMoveToTimer: Bool {
        !goal.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !csf.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !output.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    init(selectTabAction: @escaping (Int) -> Void) {
        self.selectTabAction = selectTabAction
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer(minLength: 40)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("집중의 목표를 설정해보세요")
                            .font(.customSemiBold(ofSize: 24))
                            .foregroundColor(.mainText)
                    }
                    .frame(maxWidth: 720, alignment: .leading)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        TextFieldView(
                            inputType: .goal,
                            text: $goal
                        )
                        
                        TextFieldView(
                            inputType: .csf,
                            text: $csf
                        )
                        
                        TextFieldView(
                            inputType: .output,
                            text: $output
                        )
                    }
                    .frame(maxWidth: 720, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button {
                        savePomodoro()
                    } label: {
                        HStack(spacing: 10) {
                            Image.play
                                .font(.headline)
                            Text("시작하기")
                                .font(.customSemiBold(ofSize: 14))
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: 240)
                        .background(canMoveToTimer ? .enableStart : .gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .shadow(radius: 1)
                    .disabled(!canMoveToTimer)
                    .navigationDestination(isPresented: $shouldNavigate) {
                        PomodoroTimerView(
                            goal: $goal.wrappedValue,
                            selectTabAction: selectTabAction,
                            pomodoroID: pomodoroID
                        )
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.vertical, 28)
                .padding(.horizontal, 16)
                .frame(minWidth: 600, minHeight: 420)
            }
        }
    }
}

extension PomodoroGoalView {
    
    private func savePomodoro() {
        let realmManager = PomodoroRealmManager()
        let pomodoro = configurePomodoro()
        pomodoroID = pomodoro.id
        
        let isSaved = realmManager.save(model: pomodoro)
        if isSaved {
            shouldNavigate = true
            initInformation()
        }
    }
    
    private func configurePomodoro() -> PomodoroModel {
        let pomodoro = PomodoroModel()
        pomodoro.goal = goal
        pomodoro.csf = csf
        pomodoro.output = output
        pomodoro.dateString = dateFormatter.string(from: pomodoro.timestamp)
        
        return pomodoro
    }
    
    private func initInformation() {
        goal = ""
        csf = ""
        output = ""
    }
}
