//
//  PomodoroCardHeaderView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

import RealmSwift

struct PomodoroCardHeaderView: View {
    
    let index: Int
    let formattedTime: String
    let pomodoroID: ObjectId
    var onRemove: () -> Void
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.system(size: 12, weight: .bold))
                .frame(width: 22, height: 22)
                .background(Circle().fill(.focus))
                .foregroundStyle(.white)
            
            Text(formattedTime)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.focus)
            
            Spacer()
            
            Button {
                removePomodoro()
            } label: {
                Image.remove
                    .foregroundStyle(.remove)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.gray.opacity(0.05))
    }
}

extension PomodoroCardHeaderView {
    
    func removePomodoro() {
        let realmManager = PomodoroRealmManager()
        let isRemoved = realmManager.delete(id: pomodoroID, PomodoroModel.self)
        
        if isRemoved {
            onRemove()
        }
    }
}
