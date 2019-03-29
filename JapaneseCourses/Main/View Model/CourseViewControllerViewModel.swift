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
import Firebase

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
//        courseModels.append(CourseModel(id:"course3", name: "Vocab", numberOfLessons: 0))
    }
    
    //        let db = Firestore.firestore()
    //        var ref: DocumentReference? = nil
    //        ref = db.collection("Courses").addDocument(data: [
    //            "courseID": "course2",
    //            "courseName": "Katakana",
    //            "numberOfLessons": 100
    //        ]) { err in
    //            if let err = err {
    //                print("Error adding document: \(err)")
    //            } else {
    //                print("Document added with ID: \(ref!.documentID)")
    //            }
    //        }
    
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
        
        let db = Firestore.firestore()
        
        db.collection("Courses").getDocuments() { (querySnapshot, err) in
            if let err = err {
                self.loadInProgress.accept(false)
                
                self.cells.accept([.error(message: (err.localizedDescription))])
                
                print("Error getting documents: \(err)")
            } else {
                self.loadInProgress.accept(false)
                
                for document in querySnapshot!.documents {
                    
                    if let courseID = document.data()["courseID"] as? String, let courseName = document.data()["courseName"] as? String{
                        self.courseModels.append(CourseModel(id: courseID, name: courseName, numberOfLessons: 0))
                    }
                }
                
                self.cells.accept(self.courseModels.compactMap {CourseTableViewCellType.normal(cellViewModel: CourseViewModel(course: $0 ))})
                //compactMap help loop through models in courseModels
            }
        }
    }
}
