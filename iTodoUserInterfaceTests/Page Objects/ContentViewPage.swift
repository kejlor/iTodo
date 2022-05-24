//
//  ContentViewPage.swift
//  iTodoUserInterfaceTests
//
//  Created by Bartosz Wojtkowiak on 24/05/2022.
//

import Foundation
import XCTest

class ContentViewPage {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var todoList: XCUIElement {
        app.tables["todoList"]
    }
    
    var titleTextField: XCUIElement {
        app.textFields["titleTextField"]
    }
    
    var saveTodoButton: XCUIElement {
        app.buttons["saveTodoButton"]
    }
    
    var deleteTodoButton: XCUIElement {
        app.tables["todoList"].buttons["Delete"]
    }
}
