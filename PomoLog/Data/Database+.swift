//
//  DataBase+.swift
//  PomoLog
//
//  Created by APPLE on 12/22/25.
//

import RealmSwift

extension Database {
    
    func save<T>(model: T) -> Bool where T : Object {
        let result: ()? = try? realm?.write {
            realm?.add(model, update: .modified)
        }
        return result != nil
    }
    
    func update<T>(model: T, action: () -> Void) -> Bool where T : Object {
        let result: Void? = try? realm?.write({
            action()
        })
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
