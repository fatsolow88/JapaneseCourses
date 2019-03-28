//
//  AlphabetListViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 22/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AlphabetListViewControllerViewModel {
    
    //    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[AlphabetModel]>(value: [])
    
    init() {
        
    }
    
    var alphabetCells: Observable<[AlphabetModel]> {
        return cells.asObservable()
    }
    
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged() //only emit when there's different value than current
    }
    
    func getAlphabets(alphabet: String) {
        loadInProgress.accept(true)
        
        var alphabetModels  = [AlphabetModel]()

        if let path = Bundle.main.path(forResource: alphabet, ofType: "json") {
            let hiraganaArray = try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: path)), options: JSONSerialization.ReadingOptions()) as? [[String : String]]
            
            for hiraganaDict in hiraganaArray! {
                alphabetModels.append(AlphabetModel(char_id: hiraganaDict["char_id"] ?? "", character: hiraganaDict["character"] ?? "", romanization: hiraganaDict["romanization"] ?? ""))
            }
            
        }
        cells.accept(alphabetModels)
        
        loadInProgress.accept(false)
    }
}
