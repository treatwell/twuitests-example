import TWUITests
import XCTest

final class HomePage: UITestBase, Page {
    var mainView: XCUIElement {
        return app.otherElements[Accessibility.Home.mainView]
    }
}

// MARK: - Add to Application

extension UITestApplication {
    var homePage: HomePage {
        return HomePage(app: self)
    }
}
