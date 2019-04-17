//
//  NewWordModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 16/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class NewWordModel {
    
    var word_id         = ""
    var word_romaji     = ""
    var word_hiragana   = ""
    var created_date    = Date()
    
    convenience init(word_id : String,
                     word_romaji : String,
                     word_hiragana : String) {
        self.init()
        self.word_id        = word_id
        self.word_romaji    = word_romaji
        self.word_hiragana  = word_hiragana
    }
}
