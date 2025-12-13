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
    
    // focus : 24
    // focusSummary : 1
    // shortBreak : 5
    // longBreak : 25
    var totalTime: Int {
        let seconds = 60
        
        switch self {
        case .focus:
            return 2
        case .focusSummary:
            return 10
        case .shortBreak:
            return 2
        case .longBreak:
            return 2
        }
    }
}
