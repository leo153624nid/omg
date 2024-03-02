//
//  ColorHelper.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation
import SwiftUI

struct ColorHelper {
    func getColor(by str: String) -> Color {
        let hash = getBkdrHash(string: str)
        let hsl = getHslFromHash(hash: hash)
        
        return Color(
            hue: hsl.hue,
            saturation: hsl.saturation,
            lightness: hsl.lightness,
            opacity: 1
        )
    }
    
    private func getBkdrHash(string: String) -> Int64 {
        var hash: Int64 = 0
        let seed1: Int64 = 131
        let seed2: Int64 = 137
        
        let str = string + "x"
        let maxSafeInt = Int64.max / seed2
        str.forEach {
            if hash > maxSafeInt {
                hash /= seed2
            }
            hash = hash * seed1 + Int64($0.unicodeScalarCodePoint())
        }
        
        return hash
    }
    
    private func getHslFromHash(hash: Int64) -> (hue: Double, saturation: Double, lightness: Double) {
        let lightness: [Double] = [0.35, 0.5, 0.65]
        let saturation: [Double] = [0.35, 0.5, 0.65]
        
        let h = Double(hash % 359) / 360
        var hashValue = hash / 360
        var count = Int64(saturation.count)
        var index = Int(hashValue % count)
        let s = saturation[index]
        
        hashValue /= count
        count = Int64(lightness.count)
        index = Int(hashValue % count)
        let l = lightness[index]
        
        return (h, s, l)
    }
}

// MARK: Character To ASCII
extension Character {
    func unicodeScalarCodePoint() -> Int {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return Int(scalars[scalars.startIndex].value)
    }
}

// MARK: HSV To HSL
extension Color {
    init(
        hue: Double,
        saturation: Double,
        lightness: Double,
        opacity: Double
    ) {
        precondition(
            0...1 ~= hue &&
            0...1 ~= saturation &&
            0...1 ~= lightness &&
            0...1 ~= opacity, "input range is out of range 0...1"
        )
        
        var newSaturation: Double = 0.0
        let brightness = lightness + saturation * min(lightness, 1 - lightness)
        
        if brightness == 0 {
            newSaturation = 0.0
        } else {
            newSaturation = 2 * (1 - lightness / brightness)
        }
        
        self.init(
            hue: hue,
            saturation: newSaturation,
            brightness: brightness,
            opacity: opacity
        )
    }
}
