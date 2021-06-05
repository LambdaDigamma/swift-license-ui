import XCTest
@testable import LicenseUI

final class LicenseUITests: XCTestCase {
    
    func test_staticLoader_noData() {
        
        let staticLoader = StaticLicenseLoader()
        
        XCTAssertEqual(staticLoader.load().count, 0)
        
    }
    
    func test_staticLoader_3Items() {
        
        let staticLoader = StaticLicenseLoader(licenses: mockedLicenses())

        XCTAssertEqual(staticLoader.load().count, 3)
        
    }
    
    func test_viewModelWithStaticLoader_0_beforeLoading() {
        
        let staticLoader = StaticLicenseLoader(licenses: mockedLicenses())
        let viewModel = LicensesViewModel(loader: staticLoader)
        
        XCTAssertEqual(viewModel.licenses.count, 0)
        
    }
    
    func test_viewModelWithStaticLoader_3_afterLoading() {
        
        let staticLoader = StaticLicenseLoader(licenses: mockedLicenses())
        let viewModel = LicensesViewModel(loader: staticLoader)
        
        viewModel.loadLicenses()
        
        XCTAssertEqual(viewModel.licenses.count, 3)
        
    }
    
    // MARK: - Helper
    
    func mockedLicenses() -> [LicenseItem] {
        return [
            LicenseItem(
                name: "License 1",
                textLoader: {
                    "Lorem ipsum"
                }
            ),
            LicenseItem(
                name: "License 2",
                textLoader: {
                    "Lorem ipsum"
                }
            ),
            LicenseItem(
                name: "License 3",
                textLoader: {
                    "Lorem ipsum"
                }
            )
        ]
    }
    
}
