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
    
    init(row: Row) {
        self.viewModel = .init(row: row)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(viewModel.row.value) { cell in
                    CellView(
                        viewModel: cell,
                        color: ColorHelper.getColor(by: cell.id)
                    )
                }
            }
        }
        .padding(.horizontal, 10)
        .background(ColorHelper.getColor(by: viewModel.row.id))
        .onAppear {
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.dismissTimer()
        }
    }
}

#Preview {
    VerticalListRowView(row: Row(value: [Cell(value: 1)]))
}
