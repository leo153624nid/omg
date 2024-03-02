//
//  VerticalListRowViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Combine
import Foundation

final class VerticalListRowViewModel: ObservableObject {
    @Published var row: Row
    
    init(row: Row) {
        self.row = row
    }
}
