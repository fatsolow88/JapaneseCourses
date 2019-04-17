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
    var vocabCategoryModels  = [VocabCategoryModel]()
    
    init() {
        vocabCategoryModels.append(VocabCategoryModel(category_id: "1", category_Name: "Handshake", imageName: ""))
        vocabCategoryModels.append(VocabCategoryModel(category_id: "2", category_Name: "2shot", imageName: ""))
        vocabCategoryModels.append(VocabCategoryModel(category_id: "3", category_Name: "Concert", imageName: ""))
        vocabCategoryModels.append(VocabCategoryModel(category_id: "4", category_Name: "Theater", imageName: ""))
        vocabCategoryModels.append(VocabCategoryModel(category_id: "5", category_Name: "Performance", imageName: ""))
        vocabCategoryModels.append(VocabCategoryModel(category_id: "6", category_Name: "Blog", imageName: ""))
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
        cells.accept(vocabCategoryModels.compactMap{VocabCategoryCollectionViewCellType.normal(cellViewModel: VocabCategoryViewModel(vocabCategoryModel: $0))})
        loadInProgress.accept(false)
    }
}
