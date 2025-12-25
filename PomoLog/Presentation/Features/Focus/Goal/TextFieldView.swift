//
//  TextFieldView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct TextFieldView: View {
    
    let inputType: GoalInputType
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(inputType.title)
                .font(.customRegular(ofSize: 14))
                .foregroundStyle(.gray)
            
            TextField(text: $text) {
                Text(inputType.subtitle)
            }
            .textFieldStyle(.roundedBorder)
            .controlSize(.large)
        }
        .padding(.vertical)
    }
}
