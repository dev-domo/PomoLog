//
//  GoalPopUpView.swift
//  PomoLog
//
//  Created by APPLE on 12/17/25.
//

import SwiftUI

struct GoalPopUpView: View {
    
    @Binding var showPopUp: Bool
    
    let title: String
    let message: String
    let buttonTitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(.black)
                .opacity(0.2)
            
            VStack(spacing: 12) {
                Text(title)
                    .frame(height: 30)
                    .foregroundStyle(.mainText)
                    .fontWeight(.bold)
                    .padding(.top, 12)
                
                Divider()
                
                Text(message)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 12)
                    .foregroundStyle(.mainText)
                
                Button(action: {
                    showPopUp = false
                }, label: {
                    Text(buttonTitle)
                        .frame(width: 100)
                        .contentShape(Rectangle())
                        .foregroundStyle(.white)
                        .padding(.vertical, 8)
                })
                .buttonStyle(PlainButtonStyle())
                .background(.enableStart)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .shadow(radius: 1)
                .padding(.bottom, 12)
            }
            .background(.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    @Previewable @State var showPopUp: Bool = true
    
    GoalPopUpView(
        showPopUp: $showPopUp,
        title: "안내",
        message: "목표 메시지",
        buttonTitle: "확인"
    )
}
