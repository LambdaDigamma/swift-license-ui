//
//  PreferenceSpecifier.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import Foundation

internal let childPaneType: String = "PSChildPaneSpecifier"
internal let groupType: String = "PSGroupSpecifier"

internal struct PreferenceSpecifier: Codable, Equatable {
    let title: String?
    let type: String
    let file: String?
    let footerText: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case type = "Type"
        case file = "File"
        case footerText = "FooterText"
    }
}
