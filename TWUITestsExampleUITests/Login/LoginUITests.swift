import XCTest
import TWUITests

final class LoginUITests: UITestCase {
    func testFirstTimeUserLoginScreenIsVisible() {
        start(using: Configuration()
            .isFirstTimeUser()
        )
        .loginStep.loginScreenIsVisible()
    }

    func testEmptyUsernameOrPasswordShowsAlert() {
        start(using: Configuration()
            .isFirstTimeUser()
        )
        .loginStep.providesEmptyCredentials()
        .loginStep.errorAlertIsVisible()
    }

    func testThatUserCanLogin() {
        start(using: Configuration()
            .isFirstTimeUser()
        )
        .loginStep.providesUsername("hello@domain.com", password: "password")
        .homeStep.homeScreenIsVisible()
    }
}
