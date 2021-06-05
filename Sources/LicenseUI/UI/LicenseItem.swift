//
//  LicenseItem.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import Foundation

public struct LicenseItem: Identifiable, Equatable {
    
    public var id: UUID = UUID()
    public var name: String
    public var textLoader: () -> String
    
    public init(name: String, textLoader: @escaping () -> String) {
        self.name = name
        self.textLoader = textLoader
    }
    
    public static func == (lhs: LicenseItem, rhs: LicenseItem) -> Bool {
        return lhs.id == rhs.id
            && lhs.name == rhs.name
    }
    
}
