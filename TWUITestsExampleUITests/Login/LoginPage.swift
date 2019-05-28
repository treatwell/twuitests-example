import XCTest
import TWUITests

final class LoginPage: UITestBase, Page {
    var mainView: XCUIElement {
        return app.otherElements[Accessibility.Login.mainView]
    }

    var textFieldUsername: XCUIElement {
        return app.textFields[Accessibility.Login.TextField.userName]
    }

    var textFieldPassword: XCUIElement {
        return app.secureTextFields[Accessibility.Login.TextField.password]
    }

    var buttonLogin: XCUIElement {
        return app.buttons[Accessibility.Login.Button.login]
    }
}

// MARK: - Add to Application

extension UITestApplication {
    var loginPage: LoginPage {
        return LoginPage(app: self)
    }
}
