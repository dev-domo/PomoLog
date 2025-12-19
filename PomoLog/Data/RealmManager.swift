//
//  RealmManager.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import RealmSwift

final class RealmManager: DataBase {
    
    private let realm: Realm?
    
    init(realm: Realm? = try? Realm()) {
        self.realm = realm
    }
    
    func save<T>(model: T) -> Bool where T : Object {
        let result: ()? = try? realm?.write {
            // 이미 id가 존재하면 업데이트
            realm?.add(model, update: .modified)
        }
        return result != nil
    }
    
    func fetchAll<T>(_ type: T.Type) -> Results<T>? where T : Object {
        let results = realm?.objects(T.self)
        return results
    }
    
    func fetchById<T>(id: ObjectId, _ type: T.Type) -> T? where T : Object {
        let result = realm?.object(ofType: T.self, forPrimaryKey: id)
        return result
    }
    
    func delete<T: Object>(id: ObjectId, _ type: T.Type) -> Bool {
        guard let model = fetchById(id: id, type),
              !model.isInvalidated else {
            return false
        }
        
        let result: ()? = try? realm?.write({
            realm?.delete(model)
        })
        return result != nil
    }
}
