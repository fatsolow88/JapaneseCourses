//
//  ApplicationCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 20/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    
    let courseListCoordinator: CourseListCoordinator
    let vocabCategoryCoordinator: VocabCategoryCoordinator
    let newWordCoordinator: NewWordCoordinator
    
    var tabController: UITabBarController

    init(window: UIWindow) {
        self.window = window
        self.tabController = UITabBarController()
        FirebaseApp.configure()

        rootViewController = UINavigationController(rootViewController: self.tabController)
        rootViewController.navigationBar.prefersLargeTitles = false
        
        courseListCoordinator = CourseListCoordinator(presenter: rootViewController)
        courseListCoordinator.start()
        courseListCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Basic", image: UIImage(named: "icons8-alphabet-50"), selectedImage: UIImage(named: "icons8-alphabet-50"))
        
        vocabCategoryCoordinator = VocabCategoryCoordinator(presenter: rootViewController)
        vocabCategoryCoordinator.start()
        vocabCategoryCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(named: "icons8-type-50"), selectedImage: UIImage(named: "icons8-type-50"))
        
        newWordCoordinator = NewWordCoordinator(presenter: rootViewController)
        newWordCoordinator.start()
        newWordCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "New Word", image: UIImage(named: "icons8-add-new-50"), selectedImage: UIImage(named: "icons8-add-new-50"))
        
        var controllers: [UIViewController] = []
        controllers.append(courseListCoordinator.rootViewController)
        controllers.append(vocabCategoryCoordinator.rootViewController)
        controllers.append(newWordCoordinator.rootViewController)
        
        tabController.viewControllers = controllers
        
    }

    func start() {  // 6
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
