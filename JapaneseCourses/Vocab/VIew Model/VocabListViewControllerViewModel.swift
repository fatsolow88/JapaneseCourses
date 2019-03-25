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
    case normal(cellViewModel: VocabModel)
    case error(message: String)
    case empty
}

class VocabListViewControllerViewModel {
    
    //    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[VocabTableViewCellType]>(value: [])
    
    init() {

    }
    
    var courseCells: Observable<[VocabTableViewCellType]> {
        return cells.asObservable()
    }
    
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged() //only emit when there's different value than current
    }
    
    func getCourses() {
        loadInProgress.accept(true)
        
        
        
        loadInProgress.accept(false)
    }
}
