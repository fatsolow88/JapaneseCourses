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
        
        loadInProgress.accept(false)
        self.onNavigateBack.onNext(())

                //        appServerClient.postFriend(
        //            firstname: firstname.value,
        //            lastname: lastname.value,
        //            phonenumber: phonenumber.value)
        //            .subscribe(
        //                onNext: { [weak self] _ in
        //                    self?.loadInProgress.accept(false)
        //                    self?.onNavigateBack.onNext(())
        //                },
        //                onError: { [weak self] error in
        //                    guard let `self` = self else {
        //                        return
        //                    }
        //
        //                    self.loadInProgress.accept(false)
        //
        //                    let okAlert = SingleButtonAlert(
        //                        title: (error as? AppServerClient.PostFriendFailureReason)?.getErrorMessage() ?? "Could not connect to server. Check your network and try again later.",
        //                        message: "Could not add \(self.firstname.value) \(self.lastname.value).",
        //                        action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
        //                    )
        //
        //                    self.onShowError.onNext(okAlert)
        //                }
        //            )
        //            .disposed(by: disposeBag)
    }
}
