//
//  SpecialTapGestureView.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation
import SwiftUI

struct SpecialTapGestureView: UIViewRepresentable {
    let onLongTapped: () -> Void
    let onEnded: () -> Void

    func makeUIView(context: UIViewRepresentableContext<SpecialTapGestureView>) -> UIView {
        let view = UIView(frame: .zero)
        let gesture = UILongPressGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.action)
        )
        gesture.minimumPressDuration = 0.1
        gesture.delegate = context.coordinator
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SpecialTapGestureView>) {}

    class Coordinator: NSObject {
        let onLongTapped: () -> Void
        let onEnded: () -> Void

        init(onLongTapped: @escaping () -> Void, onEnded: @escaping () -> Void) {
            self.onLongTapped = onLongTapped
            self.onEnded = onEnded
        }

        @objc
        func action(_ sender: UIPanGestureRecognizer) {
            if sender.state == .began {
                onLongTapped()
            } else if sender.state == .ended {
                onEnded()
            }
        }
    }

    func makeCoordinator() -> SpecialTapGestureView.Coordinator {
        Coordinator(onLongTapped: onLongTapped, onEnded: onEnded)
    }
}

extension SpecialTapGestureView.Coordinator: UIGestureRecognizerDelegate {
    func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        true
    }
}
