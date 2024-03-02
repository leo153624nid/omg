//
//  VerticalListRowView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation
import SwiftUI

struct VerticalListRowView: View {
    @ObservedObject var viewModel: VerticalListRowViewModel
    
    private let colorHelper = ColorHelper()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1..<10) {
                    let item = viewModel.row.value[$0]
                    
                    CellView(
                        viewModel: item,
                        color: colorHelper.getColor(by: item.id)
                    )
                }
            }
        }
        .padding(.horizontal, 10)
        .background(colorHelper.getColor(by: viewModel.row.id))
    }
}

#Preview {
    VerticalListRowView(viewModel: .init(row: .init(value: [])))
}
