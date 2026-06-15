//
//  LicenseManagerShim.swift
//  FreeAltTabTools
//
//  Created by Ky on 2026-06-15.
//

import Foundation



/// This shim tracks license manager state which is different for
public struct LicenseManagerShim {
    
    /// The license state that the user can choose manually.
    ///
    /// Default to the license which gives the user the most features.
    public var userChosenLicenseState: UserChosenLicenseState = .pro
    
    
    public init() {
        
    }
}



public extension LicenseManagerShim {
    
    /// Whether the current license is a "lifetime" variant of that license.
    ///
    /// Lifetime licenses never expire; they always remain in whatever state they're currently in, unless the user changes it.
    var isLifetimeVariant: Bool {
        true
    }
    
    
    /// Decides the license state to actually use
    func computeState() -> UserChosenLicenseState {
        userChosenLicenseState
    }
}



/// The license state that the user chooses manually
public enum UserChosenLicenseState {
    
    /// The user wants both free and pro-licensed features
    case pro
    
    /// The user wants only the free set of features
    case free
}
