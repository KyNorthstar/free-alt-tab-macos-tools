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
    
    @Binding
    var licenseState: UserChosenLicenseState
    
    
    public var body: some View {
        Form {
            if #available(macOS 14, *) {
                proModeToggle
                    .controlSize(.extraLarge)
            }
            else if #available(macOS 11, *) {
                proModeToggle
                    .controlSize(.large)
            }
            else {
                proModeToggle
            }
            
            Text("You get to decide whether you want to use Pro mode or not. No restrictions!")
        }
    }
    
    
    var proModeToggle: some View {
        Toggle("Pro mode", isOn: Binding{
            switch licenseState {
            case .pro: true
            case .free: false
            }
        } set: { proMode in
            licenseState = proMode ? .pro : .free
        })
        .toggleStyle(.switch)
    }
}



@available(macOS 10.15, *)
public extension ProUpgradeView {
    static func nsView(licenseState: Binding<UserChosenLicenseState>) -> NSView {
        let view = NSHostingView(rootView: ProUpgradeView(licenseState: licenseState))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }
}



@available(macOS 10.15, *)
#Preview {
    ProUpgradeView(licenseState: .constant(.pro))
}
