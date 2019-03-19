//
//  CourseViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 14/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

struct CourseViewModel {
    
    let name: String
    let count: Int
    let id: String
    
    let numberOfLessonsString: String
    
    // Dependency Injection (DI)
    init(course: CourseModel) {
        self.name = course.name
        self.count = course.numberOfLessons
        self.id = course.id
        
        //Handle the display style / context
        if(course.numberOfLessons > 100){
            numberOfLessonsString = "More than 100 courses"
        }else if(course.numberOfLessons == 0){
            numberOfLessonsString = ""
        }else{
            numberOfLessonsString = "\(course.numberOfLessons)" + " courses"
        }
    }
}
