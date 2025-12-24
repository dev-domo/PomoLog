//
//  PomodoroRealmManagerTest.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import Foundation
import Testing

import RealmSwift

@testable import PomoLog
struct PomodoroRealmManagerTest {
    
    @Test("날짜를 기준으로 포모도로 기록 조회")
    func fetchByDate_pomodoro__success() throws {
        let configuration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
        let realm = try? Realm(configuration: configuration)
        let realmManager = PomodoroRealmManager(realm: realm)
        let pomodoroModel = PomodoroModel()
        let _ = realmManager.save(model: pomodoroModel)
        
        let fetchedData = try #require(realmManager.fetchByDate(target: Date()))
        
        #expect(fetchedData.first == pomodoroModel)
    }
}
