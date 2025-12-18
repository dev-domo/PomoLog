//
//  PomodoroModel.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import Foundation

import RealmSwift

final class PomodoroModel: Object {
    
    // @objc dynamic -> @Persisted (프로퍼티 래퍼)
    // id : Int -> ObjectId
    
    @Persisted(primaryKey: true)
    var id: ObjectId = ObjectId.generate()
    
    @Persisted
    var goal: String = ""
    
    @Persisted
    var csf: String = ""
    
    @Persisted
    var summaries: List<String>
    
    @Persisted
    var timestamp: Date = Date()
    
    @Persisted
    var dateString: String = ""
    
    @Persisted
    var focusTime: Int = 0
}
