//
//  CalendarView.swift
//  PomoLog
//
//  Created by APPLE on 12/25/25.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var month: Date
    @Binding var clickedDate: Date
    
    var body: some View {
        VStack {
            HeaderView(month: $month)
            GridView(
                month: $month,
                clickedDate: $clickedDate
            )
        }
        .padding()
    }
}
