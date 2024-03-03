//
//  Cell.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation

final class Cell: Identifiable, ObservableObject {
    let id = UUID().uuidString
    @Published var value: Int
    
    init(value: Int) {
        self.value = value
    }
}

extension Cell: Equatable {
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        lhs.id == rhs.id &&
        lhs.value == rhs.value
    }
}
