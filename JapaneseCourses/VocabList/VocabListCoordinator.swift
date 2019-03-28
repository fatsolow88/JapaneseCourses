//
//  VocabListCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class VocabListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var vocabListViewController: VocabListViewController?
        
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VocabListViewControllerSID") as? VocabListViewController
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.vocabListViewController = controller
    }
}
