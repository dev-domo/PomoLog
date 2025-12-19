//
//  SummaryModel.swift
//  PomoLog
//
//  Created by APPLE on 12/18/25.
//

import Foundation

import RealmSwift

final class SummaryModel: Object {
    
    @Persisted(primaryKey: true)
    var id: ObjectId = ObjectId.generate()
    
    @Persisted
    var content: String
    
    @Persisted
    var timestamp: Date
}
