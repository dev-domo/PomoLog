//
//  TimerView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct GoalView: View {
    @State private var goal = ""
    @State private var csf = ""

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.appBackground]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer(minLength: 24)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("집중할 목표를 설정해보세요")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.mainText)
                    }
                    .frame(maxWidth: 720, alignment: .leading)
                    .padding(.horizontal)
                    
                    VStack(spacing: 16) {
                        InputCard(title: "어떤 목표를 달성할 건가요?", text: $goal)
                        InputCard(title: "핵심 성공 요인(CSF)", text: $csf)
                    }
                    .frame(maxWidth: 720)
                    .padding(.horizontal)
                    
                    NavigationLink {
                        TimerView(timerStyle: .focus, goal: goal)
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "play.fill")
                                .font(.headline)
                            Text("시작하기")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: 240)
                        .background(canMoveTimer ? .enableStart : .gray)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
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
