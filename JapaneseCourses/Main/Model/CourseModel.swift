//
//  CourseModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 13/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class CourseModel {
    
    var name                = ""
    var numberOfLessons     = 0
    var id                  = ""
    
    convenience init(             id : String,
                                name : String,
                     numberOfLessons : Int) {
        self.init()
        self.id     = id
        self.name   = name
        self.numberOfLessons  = numberOfLessons
    }
}
