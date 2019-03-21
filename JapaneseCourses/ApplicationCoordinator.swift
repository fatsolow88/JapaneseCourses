//
//  ApplicationCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 20/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let courseListCoordinator: CourseListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = false
        
        courseListCoordinator = CourseListCoordinator(presenter: rootViewController)
    }
    
    func start() {  // 6
        window.rootViewController = rootViewController
        courseListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
