//
//  HeaderButtonView.swift
//  PomoLog
//
//  Created by APPLE on 12/22/25.
//

import SwiftUI

struct CalendarHeaderButtonView: View {
    
    @Binding var month: Date
    let image: Image
    let action: () -> Date
    
    var body: some View {
        Button {
            month = action()
        } label: {
            image
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.bottom)
    }
}
