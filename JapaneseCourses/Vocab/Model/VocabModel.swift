//
//  VocabModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 22/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class VocabModel {
    
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
