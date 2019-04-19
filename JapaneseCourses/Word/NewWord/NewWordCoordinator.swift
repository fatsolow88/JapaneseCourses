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
    
    private var addNewWordCoordinator: AddNewWordCoordinator?
    
    var rootViewController: UIViewController {
        return newWordViewController!
    }
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let controller = NewWordViewController.instantiate()
        controller.delegate = self
        self.newWordViewController = controller
    }
    
    func updateNewWord(newWordModel: NewWordModel){
        self.newWordViewController?.updateNewWord(newWordModel: newWordModel)
    }
}

extension NewWordCoordinator: NewWordViewControllerDelegate {
    func newWordViewControllerDidSelectWord(selectedWord: NewWordCellViewModel) {
        let addNewWordCoordinator = AddNewWordCoordinator(presenter: presenter, selectedWord: selectedWord)
        addNewWordCoordinator.start()
        addNewWordCoordinator.parentCoordinator = self
        self.addNewWordCoordinator = addNewWordCoordinator
    }
    
    func newWordViewControllerAddNewWord(newID: String) {
        let addNewWordCoordinator = AddNewWordCoordinator(presenter: presenter, newID: newID)
        addNewWordCoordinator.start()
        addNewWordCoordinator.parentCoordinator = self
        self.addNewWordCoordinator = addNewWordCoordinator
    }
}
