//
//  CleanArchitecture_MVVM_ExampleUITestsLaunchTests.swift
//  CleanArchitecture-MVVM-ExampleUITests
//
//  Created by SHIN YOON AH on 2021/12/30.
//

import XCTest

class CleanArchitecture_MVVM_ExampleUITestsLaunchTests: XCTestCase {

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
