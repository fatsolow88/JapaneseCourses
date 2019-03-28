//
//  VocabCategoryModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class VocabCategoryModel {
    
    var category_id     = ""
    var category_Name   = ""
    var imageName       = ""
    
    convenience init(category_id : String,
                     category_Name : String,
                     imageName : String) {
        self.init()
        self.category_id    = category_id
        self.category_Name  = category_Name
        self.imageName      = imageName
    }
}
