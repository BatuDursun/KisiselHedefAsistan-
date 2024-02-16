//
//  KI_S_I_SEL_HEDEF_ASI_STANIUITestsLaunchTests.swift
//  KİŞİSEL HEDEF ASİSTANIUITests
//
//  Created by Batu Dursun on 14.12.2023.
//

import XCTest

final class KI_S_I_SEL_HEDEF_ASI_STANIUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
