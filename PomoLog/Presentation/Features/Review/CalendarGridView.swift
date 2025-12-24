//
//  CalendarGridView.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import SwiftUI

struct CalendarGridView: View {
    
    private let pomodoroRealmManager = PomodoroRealmManager()
    
    @Binding var month: Date
    @Binding var clickedDate: Date
    
    init(
        month: Binding<Date>,
        clickedDate: Binding<Date>
    ) {
        self._month = month
        self._clickedDate = clickedDate
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                let daysInMonth = numberOfDays(in: self.month)
                let firstWeekDay = firstWeekdayOfMonth(in: self.month) - 1
                
                ForEach(0 ..< daysInMonth + firstWeekDay, id: \.self) {
                    initCalendarCell(index: $0, firstWeekday: firstWeekDay)
                }
            }
        }
    }
}

extension CalendarGridView {
    
    private func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    private func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    @ViewBuilder
    private func initCalendarCell(index: Int, firstWeekday: Int) -> some View {
        if index < firstWeekday {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.clear)
        } else {
            let date = getDate(for: index - firstWeekday)
            let day = index - firstWeekday + 1
            let clicked = clickedDate == date
            let hasPomodoro = hasPomodoro(date: date)
            
            CalendarCellView(
                day: day,
                clicked: clicked,
                hasPomodoro: hasPomodoro
            )
            .onTapGesture {
                clickedDate = date
            }
        }
    }
    
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    private func hasPomodoro(date: Date) -> Bool {
        return pomodoroRealmManager.hasPomodoro(target: date) ?? false
    }
    
    private func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
}
