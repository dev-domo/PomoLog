//
//  PomoLogTest.swift
//  PomoLogTest
//
//  Created by APPLE on 12/18/25.
//

import Foundation
import Testing

import RealmSwift

@testable import PomoLog

struct RealmManagerTest {

    @Test("SummaryModel을 DB에 저장")
    func save_summaryModel__success() {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        
        let isSaved = realmManager.save(model: model)
        
        #expect(isSaved)
    }
    
    @Test("같은 id의 SummaryModel을 DB에 저장하면 기존 데이터 수정")
    func save_same_summaryModel__success() {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        let _ = realmManager.save(model: model)
        
        let newModel = createSummaryModel()
        newModel.id = model.id
        newModel.content = "content"
        let isSaved = realmManager.save(model: newModel)
        
        #expect(isSaved)
        #expect(realmManager.fetchAll(SummaryModel.self)?.count == .some(1))
    }
    
    @Test("기존 SummaryModel의 속성 수정")
    func update_summaryModel__success() throws {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        let _ = realmManager.save(model: model)
        
        let fetchedModel = try #require(realmManager.fetchById(id: model.id, SummaryModel.self))
        let isUpdated = realmManager.update(model: fetchedModel) {
            fetchedModel.content = "요약"
        }
        let updatedContent = realmManager.fetchById(
            id: model.id,
            SummaryModel.self
        )?.content
        
        #expect(isUpdated)
        #expect(updatedContent == "요약")
    }
    
    @Test("DB에서 요약 데이터 전체 조회")
    func fetchAll_summaries__success() throws {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        let _ = realmManager.save(model: model)
        
        let result = try #require(realmManager.fetchAll(SummaryModel.self)?.first)
        
        #expect(result == model)
    }
    
    @Test("DB에서 id 기반 요약 데이터 조회")
    func fetchById_summary__success() throws {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        let _ = realmManager.save(model: model)
        
        let result = try #require(realmManager.fetchById(id: model.id, SummaryModel.self))
        
        #expect(result == model)
    }
    
    @Test("DB에서 id 기반 요약 데이터 삭제")
    func delete_summary__success() throws {
        let realmManager = createSummaryRealmManager()
        let model = createSummaryModel()
        let _ = realmManager.save(model: model)
        
        let isDeleted = realmManager.delete(id: model.id, SummaryModel.self)
        
        #expect(isDeleted)
    }
    
    private func createSummaryRealmManager() -> SummaryRealmManager {
        let configuration = Realm.Configuration(inMemoryIdentifier: UUID().uuidString)
        let realm = try? Realm(configuration: configuration)
        let realmManager = SummaryRealmManager(realm: realm)
        
        return realmManager
    }
    
    private func createSummaryModel() -> SummaryModel {
        .init()
    }
}
