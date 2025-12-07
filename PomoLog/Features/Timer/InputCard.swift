//
//  InputCard.swift
//  PomoLog
//
//  Created by APPLE on 12/7/25.
//

import SwiftUI

struct InputCard: View {
    let title: LocalizedStringKey
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.mainText)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .frame(maxHeight: 48)
                    .shadow(color: Color.black.opacity(0.18), radius: 6, x: 0, y: 3)

                VStack {
                    TextEditor(text: $text)
                        .frame(maxHeight: 48)
                        .padding(8)
                        .background(.clear)
                        .foregroundColor(.mainText)
                        .cornerRadius(8)
                        .scrollContentBackground(.hidden)
                }
                .padding(6)
            }
        }
    }
}
