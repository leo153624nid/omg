//
//  ContentViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var data: [Row] = []
    
    private let rowCount = Int.random(in: 100..<150)
    
    init() {
        self.data = RandomUtility.getRowArray(with: rowCount)
    }
}
