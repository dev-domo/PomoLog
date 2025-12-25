//
//  FocusStep.swift
//  PomoLog
//
//  Created by APPLE on 12/8/25.
//

import SwiftUI

enum FocusStep: Int {
    
    case focus
    case focusSummary
    case shortBreak
    case longBreak
    
    static var focusTime: Int = focus.totalTime
    
    var title: String {
        switch self {
        case .focus:
            "집중"
        case .focusSummary:
            "요약"
        case .shortBreak:
            "휴식"
        case .longBreak:
            "긴 휴식"
        }
    }
    
    var color: Color {
        switch self {
        case .focus:
            return .focus
        case .focusSummary:
            return .focusSummary
        case .shortBreak:
            return .shortBreak
        case .longBreak:
            return .longBreak
        }
    }
    
    var totalTime: Int {
        let seconds = 60
        
        switch self {
        case .focus:
            return 24 * seconds
        case .focusSummary:
            return 1 * seconds
        case .shortBreak:
            return 5 * seconds
        case .longBreak:
            return 25 * seconds
        }
    }
}
