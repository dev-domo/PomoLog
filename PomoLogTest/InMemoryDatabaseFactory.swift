//
//  InMemoryDatabaseFactory.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import Foundation

import RealmSwift

struct InMemoryDatabaseFactory {
    
    static func createRealm() -> Realm? {
        let configuration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
        let realm = try? Realm(configuration: configuration)
        
        return realm
    }
}
