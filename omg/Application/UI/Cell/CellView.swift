//
//  CellView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation
import SwiftUI

struct CellView: View {
    @ObservedObject var viewModel: Cell
    
    private let width: CGFloat
    private let height: CGFloat
    private let color: Color
    
    @State private var isTapped = false
    
    init(
        viewModel: Cell,
        width: CGFloat = 100,
        height: CGFloat = 120,
        color: Color = .blue
    ) {
        self.viewModel = viewModel
        self.width = width
        self.height = height
        self.color = color
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
            Text(viewModel.value.description)
                .padding(.all, 5)
        }
        .frame(width: width, height: height)
        .scaleEffect(isTapped ? 0.8 : 1)
        .animation(.linear(duration: 0.3), value: isTapped)
        .overlay(SpecialTapGestureView(
            onLongTapped: { isTapped = true },
            onEnded: { isTapped = false }
        ))
    }
}

#Preview {
    CellView(viewModel: .init(value: 1))
}
