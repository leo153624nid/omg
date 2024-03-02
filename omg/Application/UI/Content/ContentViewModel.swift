//
//  ContentViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Combine
import Foundation

final class ContentViewModel: ObservableObject {
    @Published var data: [Row] = []
    
    private let rowCount = Int.random(in: 100..<150)
    private var randomInt: Int {
        Int.random(in: 10..<20)
    }
    
    init() {
        self.data = getRowArray(with: rowCount)
    }
    
    private func getRowArray(with count: Int) -> [Row] {
        return (0..<count).map { _ in
            Row(value: getCellArray(with: randomInt))
        }
    }
    
    private func getCellArray(with count: Int) -> [Cell] {
        return (0..<count).map { _ in Cell(value: randomInt) }
    }
}
