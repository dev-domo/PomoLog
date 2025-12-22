//
//  Date+.swift
//  PomoLog
//
//  Created by APPLE on 12/22/25.
//

import Foundation

extension Date {
    
    static let calendar = Calendar.current
    
    static func == (lhs: Date, rhs: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(lhs, equalTo: rhs, toGranularity: .day)
    }
}
