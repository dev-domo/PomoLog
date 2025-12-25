//
//  CalendarCellView.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import SwiftUI

struct CellView: View {
    
    let day: Int
    let clicked: Bool
    let hasPomodoro: Bool
    
    var body: some View {
        VStack(spacing: 2) {
            Text("\(day)")
                .font(.customLight(ofSize: 14))
                .foregroundStyle(clicked ? .white : .mainText)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(clicked ? .enableStart : .white)
                )
            
            Rectangle()
                .frame(width: 14, height: 4)
                .foregroundStyle(.enableStart)
                .opacity(hasPomodoro ? 1 : 0)
        }
    }
}
