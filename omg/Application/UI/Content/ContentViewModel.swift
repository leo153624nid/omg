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
    
    private var cancellables = Set<AnyCancellable>()
    private let rowCount = Int.random(in: 100..<150)
    private var randomInt: Int {
        Int.random(in: 10..<20)
    }
    
    init() {
        self.data = getRowArray(with: rowCount)
        startTimer(by: 1)
    }
    
    private func getRowArray(with count: Int) -> [Row] {
        return (0..<count).map { _ in
            Row(value: getCellArray(with: randomInt))
        }
    }
    
    private func getCellArray(with count: Int) -> [Cell] {
        return (0..<count).map { _ in Cell(value: randomInt) }
    }
    
    private func startTimer(by interval: TimeInterval) {
        Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] time in
                print("The time is now \(time)")
                guard let self else { return }
                self.updateData()
            }
            .store(in: &cancellables)
    }
    
    private func updateData() { // TODO: - add VerticalListRowViewModel (class) and remove timer to each VM (update data in each row)
        let cellId = self.data[0].value.first?.id
        let cellIndex = self.data[0].value.firstIndex(where: { $0.id == cellId }) ?? 0 // TODO
        var cell = self.data[0].value.remove(at: cellIndex)
        cell.value = randomInt
        self.data[0].value.insert(cell, at: cellIndex)
    }
}
