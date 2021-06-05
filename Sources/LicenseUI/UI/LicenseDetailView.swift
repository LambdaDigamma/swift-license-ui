//
//  LicenseDetailView.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import SwiftUI

public struct LicenseDetailView: View {
    
    public var licenseItem: LicenseItem
    
    @ScaledMetric var textSize: CGFloat = 14
    
    public var body: some View {
        
        ScrollView {
            
            Text(licenseItem.textLoader())
                .font(Font.system(size: textSize, weight: .regular, design: .monospaced))
                .padding()
                .navigationBarTitle(licenseItem.name)
                .padding(.bottom)
            
        }
        
    }
    
}

struct LicenseDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let license = LicenseItem(name: "LicenseUI (0.0.1)") {
            License.MIT(year: 2021, copyrightHolder: "Lennart Fischer").text
        }
        
        Group {
            NavigationView {
                LicenseDetailView(licenseItem: license)
            }
            NavigationView {
                LicenseDetailView(licenseItem: license)
            }
            .environment(\.colorScheme, .dark)
        }
        
    }
    
}
