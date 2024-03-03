//
//  VerticalListRowViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 03.03.2024.
//

import Combine
import Foundation

final class VerticalListRowViewModel: ObservableObject {
    var row: Row
    
    private var cancellables = Set<AnyCancellable>()
    private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(row: Row) {
        self.row = row
    }
    
    func dismissTimer() {
        timer.upstream.connect().cancel()
        cancellables = .init()
    }
    
    func startTimer() {
        timer
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.updateData()
            }
            .store(in: &cancellables)
    }
    
    private func updateData() {
        guard let cellIndex = row.value.randomIndex() else { return }
        
        var cell = row.value.remove(at: cellIndex)
        cell.value = RandomUtility.randomIntFrom10To20
        row.value.insert(cell, at: cellIndex)
    }
}
