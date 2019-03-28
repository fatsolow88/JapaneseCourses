//
//  VocabCategoryViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum VocabCategoryCollectionViewCellType {
    case normal(cellViewModel: VocabCategoryViewModel)
    case error(message: String)
    case empty
}

class VocabCategoryViewControllerViewModel {
    
    //    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[VocabCategoryCollectionViewCellType]>(value: [])
    var vocabModels  = [VocabCategoryModel]()
    
    init() {
//        vocabModels.append(VocabModel(vocab_id: "1", vocab: "ああ", romanization: "aa"))
    }
    
    var vocabCategoryCells: Observable<[VocabCategoryCollectionViewCellType]> {
        return cells.asObservable()
    }
    
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged() //only emit when there's different value than current
    }
    
    func getVocabCategory() {
        loadInProgress.accept(true)
//        cells.accept(vocabModels.compactMap{VocabTableViewCellType.normal(cellViewModel: VocabViewModel(vocabModel: $0))})
        loadInProgress.accept(false)
    }
}
