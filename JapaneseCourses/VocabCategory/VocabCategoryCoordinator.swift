//
//  VocabCategoryCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class VocabCategoryCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var vocabCategoryViewController: VocabCategoryViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VocabCategoryViewControllerSID") as? VocabCategoryViewController
        controller?.delegate = self
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.vocabCategoryViewController = controller
    }
}

extension VocabCategoryCoordinator: VocabCategoryViewControllerDelegate {
    func vocabCategoryViewControllerDidSelectCategory(selectedModel: VocabCategoryViewModel) {
        
    }
}
