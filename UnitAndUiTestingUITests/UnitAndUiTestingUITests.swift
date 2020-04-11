//
//  UnitAndUiTestingUITests.swift
//  UnitAndUiTestingUITests
//
//  Created by Лаура Есаян on 07.04.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import XCTest

class UnitAndUiTestingUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectCases() throws {
        let element2 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element
        let loginTextField = element.children(matching: .textField).element(boundBy: 0)
        let passwordTextField = element.children(matching: .textField).element(boundBy: 1)

        loginTextField.tap()
        loginTextField.typeText("jkaf@mail.com")
        XCTAssertTrue(app.staticTexts["Correct email"].exists)
        
        passwordTextField.tap()
        passwordTextField.typeText("gfs141Fas")
        XCTAssertTrue(app.staticTexts["Correct password"].exists)

    }
    
    func testIncorrectCases() throws {
        let element2 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element
        let loginTextField = element.children(matching: .textField).element(boundBy: 0)
        let passwordTextField = element.children(matching: .textField).element(boundBy: 1)
        
        loginTextField.tap()
        loginTextField.typeText("jkaf$mail,com")
        XCTAssertTrue(app.staticTexts["Incorrect e-mail"].exists)
        
        passwordTextField.tap()
        passwordTextField.typeText("fs!#@FS21")
        XCTAssertTrue(app.staticTexts["Password should contains \n minimum 6 characters \n at least 1 Uppercase Alphabet, \n 1 lowercase alphabet \n and 1 number"].exists)
    }
    
    func testEnterButton() throws {
        let element2 = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element
        let loginTextField = element.children(matching: .textField).element(boundBy: 0)
        let passwordTextField = element.children(matching: .textField).element(boundBy: 1)

        loginTextField.tap()
        loginTextField.typeText("sgasd@mail.com")
        XCTAssertTrue(app.staticTexts["Correct email"].exists)
        
        passwordTextField.tap()
        passwordTextField.typeText("hjgf441Fas")
        XCTAssertTrue(app.staticTexts["Correct password"].exists)
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Войти"]/*[[".buttons[\"Войти\"].staticTexts[\"Войти\"]",".staticTexts[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Congratulations!"].exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
