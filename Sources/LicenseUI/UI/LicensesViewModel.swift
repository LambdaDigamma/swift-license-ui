//
//  LicensesViewModel.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import SwiftUI
import OSLog

internal let subsystem = "com.lambdadigamma.license-ui"

public class LicensesViewModel: ObservableObject {
    
    @Published public var licenses: [LicenseItem] = []
    
    private let logger: Logger
    
    public init(
        licenses: [LicenseItem] = [],
        logger: Logger = logger()
    ) {
        self.licenses = licenses
        self.logger = logger
    }
    
    public init(
        logger: Logger = logger()
    ) {
        self.logger = logger
    }
    
    public func loadLicenses() {
        
        do {
            let decoder = PropertyListDecoder()
            let data = try licenseOverviewData()
            let specifiers = try decoder.decode(SpecifierList.self, from: data).specifiers
            
            licenses = specifiers
                .filter { $0.type == childPaneType }
                .map { specifier in
                    return LicenseItem(name: specifier.title ?? "", textLoader: { [weak self] in
                        self?.textLoader(fileName: specifier.file) ?? ""
                    })
                }
            
            print(licenses)
            
        } catch let error as DecodingError {
            print(error)
            logger.error("Decoding Licenses failed: \(error.failureReason ?? "")")
        } catch {
            logger.error("Loading Licenses failed: \(error.localizedDescription)")
        }
        
    }
    
    private func licenseOverviewData() throws -> Data {
        
        let licensesPlist = "com.mono0926.LicensePlist.plist"
        
        guard let settingsBundleURL = settingsBundleURL(),
              let settingsData = try? Data(contentsOf: settingsBundleURL.appendingPathComponent(licensesPlist)) else {
            return Data()
        }
        
        return settingsData
    }
    
    private func textLoader(fileName: String?) -> String {
        
        do {
            if let url = settingsBundleURL(), let fileName = fileName {
                let data = try Data(contentsOf: url.appendingPathComponent(fileName + ".plist"))
                let decoder = PropertyListDecoder()
                let specifierList = try decoder.decode(SpecifierList.self, from: data)
                
                let text = specifierList.specifiers
                    .filter { $0.type == groupType }
                    .first?
                    .footerText
                
                return text ?? ""
                
            }
        } catch let error as DecodingError {
            print(error)
            logger.error("Loading License failed: \(error.failureReason ?? "")")
        } catch {
            logger.error("Loading License Text failed: \(error.localizedDescription)")
        }
        
        return ""
    }
    
    private func settingsBundleURL() -> URL? {
        let settingsName = "Settings"
        let settingsExtension = "bundle"
        return Bundle.main.url(forResource: settingsName, withExtension: settingsExtension)
    }
    
    public static func logger() -> Logger {
        Logger(subsystem: subsystem, category: "Licenses")
    }
    
}
