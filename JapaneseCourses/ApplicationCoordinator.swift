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
        courseListCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        vocabCategoryCoordinator = VocabCategoryCoordinator(presenter: rootViewController)
        vocabCategoryCoordinator.start()
        vocabCategoryCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        newWordCoordinator = NewWordCoordinator(presenter: rootViewController)
        newWordCoordinator.start()
        newWordCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
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
