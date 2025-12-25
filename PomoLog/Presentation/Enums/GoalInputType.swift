//
//  GoalInputType.swift
//  PomoLog
//
//  Created by APPLE on 12/26/25.
//

enum GoalInputType {
    
    case goal
    case csf
    case output
    
    var title: String {
        switch self {
        case .goal:
            "목표"
        case .csf:
            "핵심 성공 요인"
        case .output:
            "아웃풋"
        }
    }
    
    var subtitle: String {
        switch self {
        case .goal:
            "이번 포모도로 동안 어떤 목표를 달성할 건가요?"
        case .csf:
            "목표 달성을 위한 핵심 성공 요인은 무엇인가요?"
        case .output:
            "목표를 달성하면 어떤 결과물이 나올까요?"
        }
    }
}
