//
//  Array+RandomIndex.swift
//  omg
//
//  Created by Aleksey Chaykin on 03.03.2024.
//

import Foundation

extension Array {
    func randomIndex() -> Int? {
        guard !isEmpty else { return nil }
        return Int(arc4random_uniform(UInt32(self.count)))
    }
}
