//
//  iTodoUserInterfaceTests.swift
//  iTodoUserInterfaceTests
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import XCTest

class when_app_is_launched: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func tests_should_not_display_any_tasks() {
        let todoList = contentViewPage.todoList
        XCTAssertEqual(0, todoList.cells.count)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class when_user_creates_new_todo_task: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_display_todo_successfully() {
        let titleTextField = contentViewPage.titleTextField
        titleTextField.tap()
        titleTextField.typeText("Learn new words")
        
        let saveTodoButton = contentViewPage.saveTodoButton
        saveTodoButton.tap()
        
        let todoList = contentViewPage.todoList
        XCTAssertEqual(1, todoList.cells.count)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}

class when_user_deletes_a_new_todo_task: XCTestCase {
    private var app: XCUIApplication!
    private var contentViewPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentViewPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_delete_todo_successfully() {
        let titleTextField = contentViewPage.titleTextField
        titleTextField.tap()
        titleTextField.typeText("Learn new words")
        
        let saveTodoButton = contentViewPage.saveTodoButton
        saveTodoButton.tap()
        
        let cell = contentViewPage.todoList.cells["Learn new words"]
        cell.swipeLeft()
        contentViewPage.deleteTodoButton.tap()
        XCTAssertFalse(cell.exists)
    }
    
    override func tearDown() {
        Springboard.deleteApp()
    }
}
