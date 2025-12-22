//
//  PomodoroRealmManager.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import Foundation

import RealmSwift

final class PomodoroRealmManager: DataBase {
    
    var realm: Realm?
    
    init(realm: Realm? = RealmFactory.shared.createRealm()) {
        self.realm = realm
    }
    
    func fetchByDate(target date: Date) -> [PomodoroModel]? {
        return realm?.objects(PomodoroModel.self).filter({ $0.timestamp == date })
    }
}
