//
//  WHCourseModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 13/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class CourseModel {
    
    var name    = ""
    var count   = 0
    var id      = "asdasdadsad"
    
    convenience init(name : String,
                     count : Int) {
        self.init()
        self.name   = name
        self.count  = count
    }
}
