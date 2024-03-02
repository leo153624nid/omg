//
//  ContentView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("OMG")
            
            Divider()
            
            listView
        }
    }
    
    private var listView: some View {
        List {
            ForEach(viewModel.data, id: \.hashValue) { item in
                VerticalListRowView(viewModel: .init(item: item))
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
