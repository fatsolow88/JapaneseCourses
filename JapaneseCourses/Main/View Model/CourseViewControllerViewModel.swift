//
//  CourseViewControllerViewModel.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 19/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum CourseTableViewCellType {
    case normal(cellViewModel: CourseViewModel)
    case error(message: String)
    case empty
}

class CourseViewControllerViewModel {
    
//    let onShowError = PublishSubject<SingleButtonAlert>()
    let disposeBag = DisposeBag()
    private let loadInProgress = BehaviorRelay(value: false)
    private let cells = BehaviorRelay<[CourseTableViewCellType]>(value: [])
    var courseModels  = [CourseModel]()

    init() {
        courseModels.append(CourseModel(id:"course1", name: "Hiragana", numberOfLessons: 0))
        courseModels.append(CourseModel(id:"course2", name: "Katakana", numberOfLessons: 0))
        courseModels.append(CourseModel(id:"course3", name: "Kanji", numberOfLessons: 1000))
        courseModels.append(CourseModel(id:"course4", name: "Keigo", numberOfLessons: 2000))
    }
    
    var courseCells: Observable<[CourseTableViewCellType]> {
        return cells.asObservable()
    }
    
    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged() //only emit when there's different value than current
    }

    func getCourses() {
        loadInProgress.accept(true)
        cells.accept(courseModels.compactMap {CourseTableViewCellType.normal(cellViewModel: CourseViewModel(course: $0 ))})
        loadInProgress.accept(false)
    }
}
