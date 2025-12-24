//
//  ReviewView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct CalendarView: View {
    
    private let dragToLeft: CGFloat = -100
    private let dragToRight: CGFloat = 100
        
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            HStack {
                VStack {
                    CalendarHeaderView(month: $month)
                    CalendarGridView(month: $month, clickedDate: $clickedDate)
                }
                
                TimelineView(clickedDate: $clickedDate)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    initOffset(gesture.translation)
                }
                .onEnded { gesture in
                    let width = gesture.translation.width
                    
                    if width < dragToLeft {
                        changeMonth(by: .next)
                    } else if width > dragToRight {
                        changeMonth(by: .previous)
                    }
                    initOffset()
                }
        )
    }
}

private extension CalendarView {
    
    private func initOffset(_ offset: CGSize = CGSize()) {
        self.offset = offset
    }
    
    private func changeMonth(by moveMonth: MoveMonth) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: moveMonth.rawValue, to: month) {
            self.month = newMonth
        }
    }
}
