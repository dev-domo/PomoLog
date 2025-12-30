//
//  TimerButton.swift
//  PomoLog
//
//  Created by APPLE on 12/8/25.
//

import SwiftUI

struct TimerButton: View {
    
    let action: () -> Void
    let image: Image
    let color: Color
    
    init(
        action: @escaping () -> Void,
        image: Image,
        color: Color
    ) {
        self.action = action
        self.image = image
        self.color = color
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .stroke(color, lineWidth: 4)
                    .frame(width: 40, height: 40)
                
                image
                    .font(.system(size: 25))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundStyle(color)
        .frame(height: 40)
    }
}
