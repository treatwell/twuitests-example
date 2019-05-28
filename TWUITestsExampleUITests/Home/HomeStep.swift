import TWUITests
import XCTest

final class HomeStep: UITestBase, Step {
    lazy var homePage = HomePage(app: app)
    
    //
}

// MARK: - Validation

extension HomeStep {
    func homeScreenIsVisible() {
        homePage.mainView.existsAfterDelay()
    }
}

// MARK: - Add to Application

extension UITestApplication {
    var homeStep: HomeStep {
        return HomeStep(app: self)
    }
}
