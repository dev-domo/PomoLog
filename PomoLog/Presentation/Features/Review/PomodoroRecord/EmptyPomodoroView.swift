//
//  Untitled.swift
//  PomoLog
//
//  Created by APPLE on 12/24/25.
//

import SwiftUI

struct EmptyPomodoroView: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text("해당 날짜에는 집중 기록이 없어요")
                    .font(.customSemiBold(ofSize: 14))
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.ultraThinMaterial)
    }
}
