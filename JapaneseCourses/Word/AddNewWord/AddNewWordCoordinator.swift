//
//  AddNewWordCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 16/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class AddNewWordCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var addNewWordViewController: AddNewWordViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddNewWordViewControllerSID") as? AddNewWordViewController
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.addNewWordViewController = controller
    }
}
