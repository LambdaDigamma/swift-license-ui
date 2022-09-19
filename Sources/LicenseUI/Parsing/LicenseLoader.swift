//
//  LicenseLoader.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import Foundation
import OSLog

internal let subsystem = "com.lambdadigamma.license-ui"

public protocol LicenseLoader {
    
    func load() -> [LicenseItem]
    
}

public class StaticLicenseLoader: LicenseLoader {
    
    public let licenses: [LicenseItem]
    
    public init(licenses: [LicenseItem] = []) {
        self.licenses = licenses
    }
    
    public func load() -> [LicenseItem] {
        return licenses
    }
    
}

public class SettingsBundleLicenseLoader: LicenseLoader {
    
    private let logger: Logger
    private let licensesPlistName: String
    
    public init(
        licensesPlistName: String = "com.mono0926.LicensePlist.plist",
        logger: Logger = logger()
    ) {
        self.licensesPlistName = licensesPlistName
        self.logger = logger
    }
    
    public func load() -> [LicenseItem] {
        
        do {
            let decoder = PropertyListDecoder()
            let data = try licenseOverviewData()
            let specifiers = try decoder.decode(SpecifierList.self, from: data).specifiers
            
            return specifiers
                .filter { $0.type == childPaneType }
                .map { specifier in
                    return LicenseItem(name: specifier.title ?? "", textLoader: { [weak self] in
                        self?.textLoader(fileName: specifier.file) ?? ""
                    })
                }
            
        } catch let error as DecodingError {
            logger.error("Decoding Licenses failed: \(String(describing: error), privacy: .public)")
        } catch {
            logger.error("Loading Licenses failed: \(String(describing: error), privacy: .public)")
        }
        
        return []
        
    }
    
    private func licenseOverviewData() throws -> Data {
        
        guard let settingsBundleURL = settingsBundleURL(),
              let settingsData = try? Data(contentsOf: settingsBundleURL.appendingPathComponent(licensesPlistName)) else {
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
            logger.error("Loading License failed: \(String(describing: error), privacy: .public)")
        } catch {
            logger.error("Loading License Text failed: \(String(describing: error), privacy: .public)")
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
