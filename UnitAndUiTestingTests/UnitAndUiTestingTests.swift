//
//  UnitAndUiTestingTests.swift
//  UnitAndUiTestingTests
//
//  Created by Лаура Есаян on 07.04.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import XCTest
@testable import UnitAndUiTesting

class UnitAndUiTestingTests: XCTestCase {
    var sut: ViewController!
    
    override func setUpWithError() throws {
        sut = ViewController()
        super.setUp()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testLoginCheckFunction() throws {
        XCTAssert(sut.validateLogin("name@email.com"), "Error in login validation")
//        XCTAssert(sut.validateLogin("sadda.mail.sc"), "Error in login validation")
        XCTAssert(sut.validateLogin("HSNshanJ@yandex.ru"), "Error in login validation")
//        XCTAssert(sut.validateLogin("Jsnsj@mail,ru"), "Error in login validation")
//        XCTAssert(sut.validateLogin("ncjdkk#nail.com"), "Error in login validation")
//        XCTAssert(sut.validateLogin("@email.com"), "Error in login validation")
//        XCTAssert(sut.validateLogin("ыфвфвфы@email.com"), "Error in login validation")
        XCTAssert(sut.validateLogin("name2@email.ge"), "Error in login validation")
    }
    
    func testPasswordCheckFunction() throws {
//        XCTAssert(sut.validatePassword("kskjbbsk"), "Error in password validation")
//        XCTAssert(sut.validatePassword("Asd2!3va12"), "Error in password validation")
        XCTAssert(sut.validatePassword("ssk234Df"), "Error in password validation")
//        XCTAssert(sut.validatePassword("вроылао"), "Error in password validation")
//        XCTAssert(sut.validatePassword("вао242Роы"), "Error in password validation")
        XCTAssert(sut.validatePassword("pasSwoRd1234"), "Error in password validation")
//        XCTAssert(sut.validatePassword("gsd@4gsF2"), "Error in password validation")
        XCTAssert(sut.validatePassword("asd352Fvs"), "Error in password validation")
    }
}
