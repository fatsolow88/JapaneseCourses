//
//  HiraganaListCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 20/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class HiraganaListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var hiraganaListViewController: HiraganaListViewController?
    private var courseListViewController: CourseListViewController?

    init(presenter: UINavigationController) {
        self.presenter = presenter
        //place to pass data
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HiraganaListViewControllerSID") as? HiraganaListViewController
        controller?.delegate = self
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.hiraganaListViewController = controller
    }
}

extension HiraganaListCoordinator: HiraganaListViewControllerDelegate {
    func hiraganaListViewControllerDidSelectHiragana(selectedModel: HiraganaModel) {
        
    }
}
