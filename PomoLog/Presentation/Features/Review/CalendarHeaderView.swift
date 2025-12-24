//
//  HeaderView.swift
//  PomoLog
//
//  Created by APPLE on 12/20/25.
//

import SwiftUI

struct CalendarHeaderView: View {
    
    private let previous: Int = -1
    private let next: Int = 1
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월"
        return formatter
    }()
    
    static let weekdaySymbols = Calendar.koreanWeekdaySymbols
    
    @Binding var month: Date
    
    var body: some View {
        VStack {
            HStack {
                CalendarHeaderButtonView(
                    month: $month,
                    image: .previous,
                    action: getPreviousMonth
                )
                .padding(.trailing)

                Text(month, formatter: Self.dateFormatter)
                    .font(.customSemiBold(ofSize: 18))
                    .padding(.bottom)
                
                
                CalendarHeaderButtonView(
                    month: $month,
                    image: .next,
                    action: getNextMonth
                )
                .padding(.leading)
            }
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.customMedium(ofSize: 14))
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
}

extension CalendarHeaderView {
    
    func getPreviousMonth() -> Date {
        Calendar.current.date(byAdding: .month, value: previous, to: month)!
    }
    
    func getNextMonth() -> Date {
        Calendar.current.date(byAdding: .month, value: next, to: month)!
    }
}
