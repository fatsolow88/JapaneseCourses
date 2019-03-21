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
    
    private var hiraganaListCoordinator: HiraganaListCoordinator?
    
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
        
        let hiraganaListCoordinator = HiraganaListCoordinator(presenter: presenter)
        hiraganaListCoordinator.start()
        self.hiraganaListCoordinator = hiraganaListCoordinator
    }
}
