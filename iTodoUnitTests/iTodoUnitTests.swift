//
//  iTodoUnitTests.swift
//  iTodoUnitTests
//
//  Created by Bartosz Wojtkowiak on 25/05/2022.
//

import XCTest
import CoreData
@testable import iTodo

class when_working_on_app: XCTestCase {
    var coreDataManager: CoreDataManagerTestStack!
    var coreDataViewModel: CoreDataViewModel!
    
    override func setUp() {
        super.setUp()
        coreDataManager = CoreDataManagerTestStack()
        coreDataViewModel = CoreDataViewModel()
    }
    
    func test_create_todo() {
        coreDataViewModel.addTodo(title: "Learn japanese")
        XCTAssertEqual(1, coreDataViewModel.todos.count)
    }
}
