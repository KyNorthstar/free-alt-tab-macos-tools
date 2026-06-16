//
//  SwiftUIView.swift
//  FreeAltTabTools
//
//  Created by Ky on 2026-06-15.
//

import SwiftUI



/// The view to show in place of the upgrade/account view
@available(macOS 10.15, *)
public struct ProUpgradeView: View {
    public var body: some View {
        Text("Hello, Pro!")
    }
}



@available(macOS 10.15, *)
public extension ProUpgradeView {
    static func nsView() -> NSView {
        let view = NSHostingView(rootView: ProUpgradeView())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }
}



@available(macOS 10.15, *)
#Preview {
    ProUpgradeView()
}
