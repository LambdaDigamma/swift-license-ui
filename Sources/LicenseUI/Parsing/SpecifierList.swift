//
//  SpecifierList.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import Foundation

/// Represents a list of preference specifiers and
/// it is needed for parsing the `.plist` files of
/// your `Settings.bundle`.
internal struct SpecifierList: Codable, Equatable {
    
    let specifiers: [PreferenceSpecifier]
    
    enum CodingKeys: String, CodingKey {
        case specifiers = "PreferenceSpecifiers"
    }
    
}
