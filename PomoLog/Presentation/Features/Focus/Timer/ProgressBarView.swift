//
//  ProgressBarView.swift
//  PomoLog
//
//  Created by APPLE on 12/10/25.
//

import SwiftUI

struct ProgressBarView: View {
    
    @Binding var cycle: Cycle
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<Cycle.allCases.count) { index in
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 10)
                    .foregroundStyle(index <= cycle.rawValue ? .gray : .lightGray)
            }
        }
        .frame(minWidth: 600, minHeight: 10, alignment: .center)
        .padding(.vertical, 10)
    }
}
