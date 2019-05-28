import XCTest
import TWUITests

final class LoginStep: UITestBase, Step {
    lazy var loginPage = LoginPage(app: app)

    func typeText(_ text: String, in textField: XCUIElement) -> LoginStep {
        textField.clearAndEnterText(text)
        return self
    }

    func tapButtonLogin() -> UITestApplication {
        loginPage.buttonLogin.tap()
        return app
    }
}

// MARK: - Combined Actions

extension LoginStep {
    func providesEmptyCredentials() -> UITestApplication {
        // Change `api/authentication` endpoint response to return failure
        app.serverUpdate(with: Stub.Authentication.failure)
        return providesUsername("", password: "")
    }

    func providesUsername(_ userName: String, password: String) -> UITestApplication {
        return typeText(userName, in: app.loginPage.textFieldUsername)
            .typeText(password, in: app.loginPage.textFieldPassword)
            .tapButtonLogin()
    }
}

// MARK: - Validation

extension LoginStep {
    func loginScreenIsVisible() {
        loginPage.mainView.existsAfterDelay()
    }

    func errorAlertIsVisible() {
        XCTAssertEqual(app.alerts.count, 1, "Error alert is not visible")
    }
}

// MARK: - Add to Application

extension UITestApplication {
    var loginStep: LoginStep {
        return LoginStep(app: self)
    }
}
