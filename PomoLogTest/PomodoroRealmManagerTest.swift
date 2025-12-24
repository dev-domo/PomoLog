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
        let realmManager = createPomodoroRealmManager()
        let pomodoroModel = createPomodoroModel()
        let _ = realmManager.save(model: pomodoroModel)
        
        let fetchedData = try #require(realmManager.fetchByDate(target: Date()))
        
        #expect(fetchedData.first == pomodoroModel)
    }
    
    @Test("오늘 날짜에 포모도로 기록이 있는지 여부 조회")
    func hasPomodoro__result() throws {
        let realmManager = createPomodoroRealmManager()
        let pomodoroModel = createPomodoroModel()
        let _ = realmManager.save(model: pomodoroModel)
        
        let hasPomodoro = try #require(realmManager.hasPomodoro(target: Date()))
        
        #expect(hasPomodoro)
    }
    
    private func createPomodoroRealmManager() -> PomodoroRealmManager {
        let realm = InMemoryDatabaseFactory.createRealm()
        let realmManager = PomodoroRealmManager(realm: realm)
        
        return realmManager
    }
    
    private func createPomodoroModel() -> PomodoroModel {
        return .init()
    }
}
