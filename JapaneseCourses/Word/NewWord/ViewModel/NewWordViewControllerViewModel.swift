//
//  NewWordViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 17/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum NewWordTableViewCellType {
    case normal(cellViewModel: NewWordCellViewModel)
    case error(message: String)
    case empty
}

class NewWordViewControllerViewModel {
    var wordCells: Observable<[NewWordTableViewCellType]> {
        return cells.asObservable()
    }
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
//    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[NewWordTableViewCellType]>(value: [])
    var wordModels  = [NewWordModel]()
    
    init() {
    }
    
    func updateNewWord(newWordModel: NewWordModel){
        var isExistingWord = false
        
        for i in 0..<wordModels.count{
            if wordModels[i].word_id == newWordModel.word_id{
                wordModels[i] = newWordModel
                isExistingWord = true
                break
            }
        }
        
        if(isExistingWord == false){
            wordModels.append(newWordModel)
        }
        
        updateCells()
    }

    func getWords() {
        loadInProgress.accept(true)
        
        updateCells()
        
        loadInProgress.accept(false)
    }
    
    func updateCells(){
        
        if(wordModels.count>0){
            cells.accept(wordModels.compactMap{NewWordTableViewCellType.normal(cellViewModel: NewWordCellViewModel(newWordModel: $0))})
        }else{
            cells.accept([NewWordTableViewCellType.empty])
        }
    }
}
