//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by Marcello Chuahy on 28/08/24.
//

import XCTest
@testable import HelloWorld

final class HelloWorldViewControllerTests: XCTestCase {

    // MARK: - System Under Test
    
    var sut: HelloWorldViewController!
    
    // MARK: - Properties
    
    let showHelloWorld = "Show Hello World"
    let hideHelloWorld = "Hide Hello World"
    
    // MARK: - Testing life cycle
    
    override func setUpWithError() throws {
        // Put setup code here.
        // This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(withIdentifier: "HelloWorldViewController") as! HelloWorldViewController)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here.
        // This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Stack View tests
    
    func test_whenLoadView_thenStackviewShouldBeHidden() throws {
        XCTAssertTrue(sut.stackView!.isHidden)
    }
    
    func test_whenButtonIsTappedOnce_thenStackviewShouldBeVisible() throws {
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertFalse(sut.stackView.isHidden)
    }
    
    func test_whenButtonIsTappedTwice_thenStackviewShouldBeHidden() throws {
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertTrue(sut.stackView.isHidden)
    }
    
    func test_whenButtonIsTappedThreeTimes_thenStackviewShouldBeVisible() throws {
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertFalse(sut.stackView.isHidden)
    }
    
    // MARK: - Button tests
    
    func test_whenLoadView_thenButtonTitleShouldBeShowHelloWorld() throws {
        XCTAssertEqual(sut.button.currentTitle, showHelloWorld)
    }
    
    func test_whenButtonIsTappedOnce_thenButtonTitleShouldBeHideHelloWorld() throws {
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.button.currentTitle, hideHelloWorld)
    }
    
    func test_whenButtonIsTappedTwice_thenButtonTitleShouldBeShowHelloWorld() throws {
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.button.currentTitle, showHelloWorld)
    }
    
    func test_whenButtonIsTappedThreeTimes_thenButtonTitleShouldBeShowHelloWorld() throws {
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        sut.button.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.button.currentTitle, hideHelloWorld)
    }

}
