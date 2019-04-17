//
//  VocabViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

struct VocabViewModel {
    
    let vocab_id : String
    let vocab : String
    let romanization : String
    
    init(vocabModel: VocabModel) {
        self.vocab_id = vocabModel.vocab_id
        self.vocab = vocabModel.vocab
        self.romanization = vocabModel.romanization
        
        //Handle the display style / context
    }
}
