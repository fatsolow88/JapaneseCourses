//
//  AlphabetListCoordinator.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 20/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class AlphabetListCoordinator: Coordinator {
    private let presenter: UINavigationController
    private var alphabetListViewController: AlphabetListViewController?
    private var courseListViewController: CourseListViewController?
    
    private let alphabet: String
    init(presenter: UINavigationController, alphabet: String) {
        self.alphabet = alphabet
        self.presenter = presenter
        //place to pass data
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AlphabetListViewControllerSID") as? AlphabetListViewController
        controller?.delegate = self
        controller?.alphabet = self.alphabet
        presenter.pushViewController(controller ?? UIViewController(), animated: true)
        self.alphabetListViewController = controller
    }
}
 
extension AlphabetListCoordinator: AlphabetListViewControllerDelegate {
    func alphabetListViewControllerDidSelectAlphabet(selectedModel: AlphabetModel) {
        
    }
}
