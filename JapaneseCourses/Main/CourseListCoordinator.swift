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
    
    var rootViewController: UIViewController {
        return courseListViewController!
    }
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let controller = CourseListViewController.instantiate()
        controller.delegate = self
//        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.courseListViewController = controller
    }
}

extension CourseListCoordinator: CourseListViewControllerDelegate {
    func courseListViewControllerDidSelectCourse(selectedCourse: CourseViewModel) {
        
        let alphabetListCoordinator = AlphabetListCoordinator(presenter: presenter, alphabet: selectedCourse.name)
        alphabetListCoordinator.start()
        self.alphabetListCoordinator = alphabetListCoordinator
    }
}
