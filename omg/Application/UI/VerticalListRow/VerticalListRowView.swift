//
//  VerticalListRowView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation
import SwiftUI

struct VerticalListRowView: View {
    private let viewModel: Row
    
    init(row: Row) {
        self.viewModel = row
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.value) { cell in
                    CellView(
                        viewModel: cell,
                        color: ColorHelper.getColor(by: cell.id)
                    )
                }
            }
        }
        .padding(.horizontal, 10)
        .background(ColorHelper.getColor(by: viewModel.id))
    }
}

#Preview {
    VerticalListRowView(row: Row(value: [Cell(value: 1)]))
}
