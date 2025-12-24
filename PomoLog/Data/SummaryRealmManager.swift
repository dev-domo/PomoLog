//
//  SummaryRealmManager.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import RealmSwift

struct SummaryRealmManager: DataBase {
    
    var realm: Realm?
    
    init(realm: Realm? = RealmFactory.shared.createRealm()) {
        self.realm = realm
    }
}
