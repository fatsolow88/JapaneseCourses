//
//  NewWordCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 17/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
class NewWordCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var newWordViewController: NewWordViewController?
    
    var rootViewController: UIViewController {
        return newWordViewController!
    }
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let controller = NewWordViewController.instantiate()
//        controller.delegate = self
//        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.newWordViewController = controller
    }
}
