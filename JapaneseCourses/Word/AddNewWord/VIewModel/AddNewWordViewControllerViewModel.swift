//
//  AddNewWordViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 16/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol NewWordViewModel {
    
    var title: BehaviorRelay<String> { get }
    var romaji: BehaviorRelay<String> { get }
    var hiragana: BehaviorRelay<String> { get }
    var newID: String {set get}
    
    var onShowLoadingHud: Observable<Bool> { get }
    
    var submitButtonEnabled: Observable<Bool> { get }
    var submitButtonTapped: PublishSubject<Void> { get }
    var onNavigateBack: PublishSubject<Void>  { get }
    
//    var onShowError: PublishSubject<SingleButtonAlert>  { get }
}

final class AddNewWordViewControllerViewModel: NewWordViewModel {
    
    var title = BehaviorRelay<String>(value: "Add Word")
    var romaji = BehaviorRelay<String>(value: "")
    var hiragana = BehaviorRelay<String>(value: "")
    
    var newID = ""

    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
    var submitButtonEnabled: Observable<Bool> {
        return Observable.combineLatest(romajiValid, hiraganaValid) { $0 && $1}
    }
    
    let submitButtonTapped = PublishSubject<Void>()
    
    let onNavigateBack = PublishSubject<Void>()
//    let onShowError = PublishSubject<SingleButtonAlert>()
    
    private let loadInProgress = BehaviorRelay<Bool>(value: false)
    private let disposeBag = DisposeBag()
    
    private var romajiValid: Observable<Bool> {
        return romaji.asObservable().map { $0.count > 0 }
    }
    private var hiraganaValid: Observable<Bool> {
        return hiragana.asObservable().map { $0.count > 0 }
    }
    
    init() {
        
        submitButtonTapped
            .subscribe(
                onNext: { [weak self] in
                    self?.postWord()
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func postWord() {
        
        loadInProgress.accept(true)
        
        //SERVER CODE AFTER THIS
        
        loadInProgress.accept(false)
        
        self.onNavigateBack.onNext(())

    }
}
