//
//  PomodoroCardHeaderView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

struct PomodoroCardHeaderView: View {
    
    let index: Int
    let formattedTime: String
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
                .font(.system(size: 12, weight: .bold))
                .frame(width: 22, height: 22)
                .background(Circle().fill(.black))
                .foregroundStyle(.white)
            
            Text(formattedTime)
                .font(.system(size: 18, weight: .bold))
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.05))
    }
}
