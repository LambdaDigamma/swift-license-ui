//
//  LicensesList.swift
//  
//
//  Created by Lennart Fischer on 05.06.21.
//

import SwiftUI

public struct LicensesList: View {
    
    @ObservedObject public var viewModel: LicensesViewModel
    
    public let loadFromSettingsBundle: Bool
    
    public init(
        viewModel: LicensesViewModel = LicensesViewModel(),
        loadFromSettingsBundle: Bool = true
    ) {
        self.viewModel = viewModel
        self.loadFromSettingsBundle = loadFromSettingsBundle
    }
    
    public var body: some View {
        
        List(viewModel.licenses) { license in
            NavigationLink(
                destination: LicenseDetailView(licenseItem: license),
                label: {
                    Text(license.name)
                }
            )
        }
        .onAppear {
            if loadFromSettingsBundle {
                viewModel.loadLicenses()
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(NSLocalizedString("Licenses", tableName: nil, bundle: .module, value: "", comment: ""))
        
    }
    
}

struct LicensesList_Previews: PreviewProvider {
    static var previews: some View {
        
        let licenses = [
            LicenseItem(name: "AppScaffold (2.2.0)", textLoader: {
                License.Apache2_0(
                    year: 2021,
                    copyrightHolder: "Lennart Fischer"
                ).text
            }),
            LicenseItem(name: "Prosemirror (1.0.0)", textLoader: {
                License.MIT(
                    year: 2021,
                    copyrightHolder: "Lennart Fischer"
                ).text
            }),
            LicenseItem(name: "LicenseUI (1.0.0)", textLoader: {
                License.MIT(
                    year: 2021,
                    copyrightHolder: "Lennart Fischer"
                ).text
            }),
            LicenseItem(name: "Nuke (10.0.0)", textLoader: {
                License.MIT(
                    year: 2021,
                    copyrightHolder: "Alex Grebenyuk"
                ).text
            })
        ]
        
        NavigationView {
            LicensesList(
                viewModel: LicensesViewModel(licenses: licenses),
                loadFromSettingsBundle: false
            )
        }
        
        NavigationView {
            LicensesList(
                viewModel: LicensesViewModel(licenses: licenses),
                loadFromSettingsBundle: false
            )
        }
        .environment(\.colorScheme, .dark)
    }
}
