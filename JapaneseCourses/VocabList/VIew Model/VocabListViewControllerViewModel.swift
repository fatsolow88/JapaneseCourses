//
//  VocabListViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 22/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum VocabTableViewCellType {
    case normal(cellViewModel: VocabViewModel)
    case error(message: String)
    case empty
}

class VocabListViewControllerViewModel {
    
    //    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[VocabTableViewCellType]>(value: [])
    var vocabModels  = [VocabModel]()

    init() {
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
    }
    
    var vocabCells: Observable<[VocabTableViewCellType]> {
        return cells.asObservable()
    }
    
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged() //only emit when there's different value than current
    }
    
    func getVocabs() {
        loadInProgress.accept(true)
        cells.accept(vocabModels.compactMap{VocabTableViewCellType.normal(cellViewModel: VocabViewModel(vocabModel: $0))})
        loadInProgress.accept(false)
    }
}
