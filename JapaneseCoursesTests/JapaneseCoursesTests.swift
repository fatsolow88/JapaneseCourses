//
//  JapaneseCoursesTests.swift
//  JapaneseCoursesTests
//
//  Created by Low Wai Hong on 13/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import XCTest
//@testable import JapaneseCourses

class JapaneseCoursesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

//    func testCourseViewModel(){
//        let course = CourseModel(id: "0", name: "Hiragana", numberOfLessons: 1000)
//        let courseViewModel = CourseViewModel(course: course)
//
//        XCTAssertEqual(course.name, courseViewModel.name)
//        XCTAssertEqual("More than 100 courses", courseViewModel.numberOfLessonsString)
//
//        let courseTwo = CourseModel(id: "0", name: "Katakana", numberOfLessons: 100)
//        let courseViewModelTwo = CourseViewModel(course: courseTwo)
//
//        XCTAssertEqual(courseTwo.name, courseViewModelTwo.name)
//        XCTAssertEqual("\(courseTwo.numberOfLessons)" + " courses", courseViewModelTwo.numberOfLessonsString)
//
//    }
}
