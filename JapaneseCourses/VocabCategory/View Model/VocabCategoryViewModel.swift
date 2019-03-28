//
//  VocabCategoryViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

struct VocabCategoryViewModel {

    let category_id : String
    let category_Name : String
    let imageName : String
    
    // Dependency Injection (DI)
    init(vocabCategoryModel: VocabCategoryModel) {
        self.category_id    = vocabCategoryModel.category_id
        self.category_Name  = vocabCategoryModel.category_Name
        self.imageName      = vocabCategoryModel.imageName
        
        //Handle the display style / context
    }
}
