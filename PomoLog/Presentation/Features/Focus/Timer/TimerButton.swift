//
//  TimerButton.swift
//  PomoLog
//
//  Created by APPLE on 12/8/25.
//

import SwiftUI

struct TimerButton: View {
    
    let action: () -> Void
    let imageName: String
    
    init(
        action: @escaping () -> Void,
        imageName: String
    ) {
        self.action = action
        self.imageName = imageName
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .stroke(.lightGray, lineWidth: 4)
                    .frame(width: 40, height: 40)
                
                Image(systemName: imageName)
                    .font(.system(size: 25))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundStyle(.lightGray)
    }
}
