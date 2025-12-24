//
//  PomodoroRealmManager.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import Foundation

import RealmSwift

final class PomodoroRealmManager: Database {
    
    var realm: Realm?
    
    init(realm: Realm? = RealmFactory.shared.createRealm()) {
        self.realm = realm
    }
    
    func fetchByDate(target date: Date) -> Results<PomodoroModel>? {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        guard let endDate = calendar.date(byAdding: .day, value: 1, to: startDate) else {
            return nil
        }
        
        let result = realm?.objects(PomodoroModel.self).where {
            $0.timestamp >= startDate && $0.timestamp < endDate
        }
        return result
    }
    
    func hasPomodoro(target date: Date) -> Bool? {
        guard let result = fetchByDate(target: date) else {
            return nil
        }
        return !result.isEmpty
    }
}
