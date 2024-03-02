//
//  ContentView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    private let rowHeight: CGFloat = ListRowConstants.rowHeight
    
    var body: some View {
        VStack(spacing: 0) {
            Text(ListRowConstants.title)
                .padding(.all, 5)
            
            Divider()
            
            listView
        }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.data) { row in
                VerticalListRowView(viewModel: .init(row: row))
                    .frame(height: rowHeight)
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView(viewModel: .init())
}
