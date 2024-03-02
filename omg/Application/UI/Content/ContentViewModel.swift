//
//  ContentViewModel.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Combine
import Foundation

final class ContentViewModel: ObservableObject {
    @Published var data: [Int] = [
        1, 2, 3, 4, 5
    ]
}
