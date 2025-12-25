//
//  TimelineView.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import Foundation
import SwiftUI

import RealmSwift

struct RecordView: View {
    
    private let realmManager = PomodoroRealmManager()
    
    @Binding var clickedDate: Date
    
    var body: some View {
        VStack {
            if let pomodoros = fetchPomodorosByDate(), !pomodoros.isEmpty {
                ShowPomodorosView(pomodoros: pomodoros)
            } else {
                EmptyPomodoroView()
            }
        }
    }
}

extension RecordView {
    
    func fetchPomodorosByDate() -> Results<PomodoroModel>? {
        let pomodoros = realmManager.fetchByDate(target: clickedDate)
        return pomodoros
    }
}
