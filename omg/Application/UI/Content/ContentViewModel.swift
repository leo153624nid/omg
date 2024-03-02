//
//  ContentViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Combine
import Foundation

final class ContentViewModel: ObservableObject {
    @Published var data: [Row] = [
        Row(value: [
            Cell(value: 1),
            Cell(value: 2),
            Cell(value: 3),
            Cell(value: 4),
            Cell(value: 5),
            Cell(value: 6),
            Cell(value: 7),
            Cell(value: 8),
            Cell(value: 9),
            Cell(value: 10)
        ]),
        Row(value: [
            Cell(value: 1),
            Cell(value: 2),
            Cell(value: 3),
            Cell(value: 4),
            Cell(value: 5),
            Cell(value: 6),
            Cell(value: 7),
            Cell(value: 8),
            Cell(value: 9),
            Cell(value: 10)
        ]),
        Row(value: [
            Cell(value: 1),
            Cell(value: 2),
            Cell(value: 3),
            Cell(value: 4),
            Cell(value: 5),
            Cell(value: 6),
            Cell(value: 7),
            Cell(value: 8),
            Cell(value: 9),
            Cell(value: 10)
        ])
    ]
}
