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
    
    init(
        action: @escaping () -> Void,
        image: Image
    ) {
        self.action = action
        self.image = image
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .stroke(.lightGray, lineWidth: 4)
                    .frame(width: 40, height: 40)
                
                image
                    .font(.system(size: 25))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundStyle(.lightGray)
    }
}
