//
//  DataBase.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import RealmSwift

protocol DataBase {
    
    func save<T: Object>(model: T) -> Bool
    func fetchAll<T: Object>(_ type: T.Type) -> Results<T>?
    func fetchById<T: Object>(id: ObjectId, _ type: T.Type) -> T?
    func delete<T: Object>(id: ObjectId, _ type: T.Type) -> Bool
}
