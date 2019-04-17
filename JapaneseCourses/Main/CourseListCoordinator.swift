//
//  CourseListCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 20/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class CourseListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var courseListViewController: CourseListViewController?
    
    private var alphabetListCoordinator: AlphabetListCoordinator?
    
    private var vocabListCoordinator: VocabListCoordinator?
    
    private var vocabCategoryCoordinator: VocabCategoryCoordinator?
    
    private var newWordCoordinator: NewWordCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CourseListViewControllerSID") as? CourseListViewController
        controller?.delegate = self
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.courseListViewController = controller
    }
}

extension CourseListCoordinator: CourseListViewControllerDelegate {
    func courseListViewControllerDidSelectCourse(selectedCourse: CourseViewModel) {
        
        if(selectedCourse.name == "Vocab"){
            let vocabListCoordinator = VocabListCoordinator(presenter: presenter)
            vocabListCoordinator.start()
            self.vocabListCoordinator = vocabListCoordinator
        }else{
//            let alphabetListCoordinator = AlphabetListCoordinator(presenter: presenter, alphabet: selectedCourse.name)
//            alphabetListCoordinator.start()
//            self.alphabetListCoordinator = alphabetListCoordinator
         
//            let vocabCategoryCoordinator = VocabCategoryCoordinator(presenter: presenter)
//            vocabCategoryCoordinator.start()
//            self.vocabCategoryCoordinator = vocabCategoryCoordinator
            
            let newWordCoordinator = NewWordCoordinator(presenter: presenter)
            newWordCoordinator.start()
            self.newWordCoordinator = newWordCoordinator
    
        }
    }
}
