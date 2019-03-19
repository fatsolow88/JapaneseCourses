//
//  HiraganaModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 15/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
class HiraganaModel {
    
    var char_id         = ""
    var character       = ""
    var romanization    = ""
    
    convenience init(char_id : String,
                     character : String,
                     romanization : String) {
        self.init()
        self.char_id        = char_id
        self.character      = character
        self.romanization   = romanization
    }
}
