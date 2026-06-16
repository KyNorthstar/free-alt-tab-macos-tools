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
        VStack {
            if #available(macOS 13, *) {
                form
                    .formStyle(.grouped)
                    .scrollDisabled(true)
            }
            else {
                form
            }
            
            Spacer()
            
            if #available(macOS 11, *) {
                HStack {
                    Spacer()
                    Image("Nyk", bundle: .module)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                        .help("There is no reason for this photo of my cat. I just thought it was cute and wanted to share it!")
                }
            }
        }
    }
    
    
    var form: some View {
        Form {
            Section {
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
            } footer: {
                Text("""
                    You get to decide whether you want to use Pro mode or not. No restrictions!
                    Turning off Pro Mode might change some of your settings.
                    """)
                    .font(.caption)
            }
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
        .font(.largeTitle)
    }
}



@available(macOS 10.15, *)
public extension ProUpgradeView {
    static func nsView(licenseState: Binding<UserChosenLicenseState>) -> NSView {
        let view = NSHostingView(rootView: ProUpgradeView(licenseState: licenseState))
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.width, .height]
        return view
    }
}



@available(macOS 10.15, *)
#Preview {
    ProUpgradeView(licenseState: .constant(.pro))
}
