//
//  ReviewView.swift
//  PomoLog
//
//  Created by APPLE on 12/6/25.
//

import SwiftUI

struct CalendarView: View {
    
    private let realmManager = PomodoroRealmManager()
    
    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDate: Date = Date()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HeaderView(month: $month)
                calendarGridView
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        changeMonth(by: 1)
                    } else if gesture.translation.width > 100 {
                        changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = numberOfDays(in: month)
        let firstWeekday: Int = firstWeekdayOfMonth(in: month) - 1
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let clicked = clickedDate == date
                        
                        CellView(day: day, clicked: clicked)
                            .onTapGesture {
                                clickedDate = date
                                fetchPomodoros(date: clickedDate)
                            }
                    }
                }
            }
        }
    }
}

// MARK: - 일자 셀 뷰
private struct CellView: View {
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

// MARK: - 내부 메서드
private extension CalendarView {
    private func getDate(for day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }
    
    func startOfMonth() -> Date {
        let components = Calendar.current.dateComponents([.year, .month], from: month)
        return Calendar.current.date(from: components)!
    }
    
    func numberOfDays(in date: Date) -> Int {
        return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    func firstWeekdayOfMonth(in date: Date) -> Int {
        let components = Calendar.current.dateComponents([.year, .month], from: date)
        let firstDayOfMonth = Calendar.current.date(from: components)!
        
        return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
    
    func changeMonth(by value: Int) {
        let calendar = Calendar.current
        if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
            self.month = newMonth
        }
    }
    
    func fetchPomodoros(date: Date) {
        print("Fetched: ", realmManager.fetchByDate(target: clickedDate))
    }
}

#Preview {
    CalendarView(month: Date())
}
