//
//  GoalView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct GoalView: View {
    
    let selectTabAction: (Int) -> Void
    
    @State private var goal = ""
    @State private var csf = ""
    
    init(selectTabAction: @escaping (Int) -> Void) {
        self.selectTabAction = selectTabAction
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("집중할 목표를 설정해보세요")
                            .font(.customSemiBold(ofSize: 24))
                            .foregroundColor(.mainText)
                    }
                    .frame(maxWidth: 720, alignment: .leading)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        TextFieldView(
                            title: "목표",
                            placeHolder: "이번 포모도로 동안 어떤 목표를 달성할 건가요?",
                            text: $goal
                        )
                        
                        TextFieldView(
                            title: "핵심 성공 요인",
                            placeHolder: "목표 달성을 위한 핵심 성공 요인은 무엇인가요?",
                            text: $csf
                        )
                    }
                    .frame(maxWidth: 720, alignment: .leading)
                    .padding(.horizontal)
                    
                    NavigationLink {
                        PomodoroTimerView(
                            cycle: .first,
                            focusStep: .focus,
                            goal: $goal.wrappedValue,
                            selectTabAction: selectTabAction
                        )
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "play.fill")
                                .font(.headline)
                            Text("시작하기")
                                .font(.customSemiBold(ofSize: 14))
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: 240)
                        .background(canMoveTimer ? .enableStart : .gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .shadow(radius: 1)
                    .disabled(!canMoveTimer)
                    
                    Spacer()
                }
                .padding(.vertical, 28)
                .padding(.horizontal, 16)
                .frame(minWidth: 600, minHeight: 420)
            }
        }
    }
    
    private var canMoveTimer: Bool {
        !goal.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !csf.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    GoalView { index in
        print(index)
    }
}
