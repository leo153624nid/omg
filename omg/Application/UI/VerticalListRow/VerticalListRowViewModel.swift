//
//  VerticalListRowViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Combine
import Foundation

final class VerticalListRowViewModel: ObservableObject {
    @Published var item: Int
    
    init(item: Int) {
        self.item = item
    }
}
