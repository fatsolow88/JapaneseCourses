//
//  VocabModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 22/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

class VocabModel {
    
    var vocab_id        = ""
    var vocab           = ""
    var romanization    = ""
    
    convenience init(vocab_id : String,
                     vocab : String,
                     romanization : String) {
        self.init()
        self.vocab_id       = vocab_id
        self.vocab          = vocab
        self.romanization   = romanization
    }
}
