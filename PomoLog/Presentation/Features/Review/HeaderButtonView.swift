//
//  HeaderButtonView.swift
//  PomoLog
//
//  Created by APPLE on 12/22/25.
//

import SwiftUI

struct HeaderButtonView: View {
    
    @Binding var month: Date
    let imageName: String
    let action: () -> Date
    
    var body: some View {
        Button {
            month = action()
        } label: {
            Image(systemName: imageName)
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.bottom)
    }
}
