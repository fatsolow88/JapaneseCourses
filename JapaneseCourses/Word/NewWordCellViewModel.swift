//
//  NewWordCellViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 17/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation

struct NewWordCellViewModel {
    
    let word_id         : String
    let word_romaji     : String
    let word_hiragana   : String
    
    let created_date    : String
    // Dependency Injection (DI)
    init(newWordModel: NewWordModel) {
        
        self.word_id        = newWordModel.word_id
        self.word_romaji    = newWordModel.word_romaji
        self.word_hiragana  = newWordModel.word_hiragana
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        self.created_date = formatter.string(from: newWordModel.created_date)
    }
    
}
