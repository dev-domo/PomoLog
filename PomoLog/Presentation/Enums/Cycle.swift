//
//  Cycle.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

enum Cycle: Int, CaseIterable {
    case first
    case second
    case third
    case fourth
    
    mutating func update() -> Self {
        self = Cycle(rawValue: self.rawValue + 1) ?? .first
        return self
    }
}
