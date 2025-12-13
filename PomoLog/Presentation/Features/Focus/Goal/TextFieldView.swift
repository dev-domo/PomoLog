//
//  TextFieldView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct TextFieldView: View {
    
    let title: String
    let placeHolder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customRegular(ofSize: 14))
                .foregroundStyle(.gray)
            
            TextField(text: $text) {
                Text(placeHolder)
            }
            .textFieldStyle(.roundedBorder)
            .controlSize(.large)
        }
        .padding(.vertical)
    }
}
