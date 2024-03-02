//
//  OMGApp.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import SwiftUI

@main
struct OMGApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
