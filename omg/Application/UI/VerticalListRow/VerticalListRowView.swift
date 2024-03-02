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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.item.description)
                .padding(.all, 10)
                .background(.red)
            
            Divider()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}

#Preview {
    VerticalListRowView(viewModel: .init(item: 1))
}
