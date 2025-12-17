//
//  QuestionMarkView.swift
//  PomoLog
//
//  Created by APPLE on 12/17/25.
//

import SwiftUI

struct QuestionMarkView: View {
    
    @Binding var showPopUp: Bool
    let goal: String
    
    var body: some View {
        Button {
            showPopUp = true
        } label: {
            Image(systemName: "questionmark.circle.fill")
                .frame(width: 50)
                .foregroundStyle(.gray)
        }
        .frame(width: 20)
        .buttonStyle(PlainButtonStyle())
        .cornerRadius(25)
    }
}
