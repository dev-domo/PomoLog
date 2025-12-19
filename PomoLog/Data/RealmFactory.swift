//
//  RealmFactory.swift
//  PomoLog
//
//  Created by APPLE on 12/19/25.
//

import RealmSwift

final class RealmFactory {
    
    static let shared = RealmFactory()
    
    private let configuration = Realm.Configuration.defaultConfiguration
    
    private init() {}
    
    func createRealm() -> Realm? {
        return try? Realm(configuration: configuration)
    }
}
