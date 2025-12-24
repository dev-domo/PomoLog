//
//  CalendarCellView.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import SwiftUI

struct CalendarCellView: View {
    var day: Int
    var clicked: Bool
    
    init(day: Int, clicked: Bool) {
        self.day = day
        self.clicked = clicked
    }
    
    var body: some View {
        VStack {
            Text("\(day)")
                .font(.customLight(ofSize: 14))
                .foregroundStyle(clicked ? .white : .mainText)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(clicked ? .enableStart : .white)
                )
        }
    }
}
