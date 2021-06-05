//
//  LicensesViewModel.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import SwiftUI
import OSLog

public class LicensesViewModel: ObservableObject {
    
    @Published public var licenses: [LicenseItem] = []
    
    private let loader: LicenseLoader
    
    public init(
        loader: LicenseLoader = SettingsBundleLicenseLoader()
    ) {
        self.loader = loader
    }
    
    public init(
        licenses: [LicenseItem]
    ) {
        self.loader = StaticLicenseLoader(licenses: licenses)
    }
    
    public func loadLicenses() {
        self.licenses = loader.load()
    }
    
}
