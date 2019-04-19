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
    private var selectedWord: NewWordCellViewModel?
    private var newID: String?
    
    weak var parentCoordinator: NewWordCoordinator?

    init(presenter: UINavigationController, selectedWord: NewWordCellViewModel) {
        self.presenter = presenter
        self.selectedWord = selectedWord
    }
    
    init(presenter: UINavigationController, newID: String) {
        self.presenter = presenter
        self.newID = newID
    }
    
    func start() {
        
        let controller = AddNewWordViewController.instantiate()
        controller.delegate = self
        
        let viewModel = AddNewWordViewControllerViewModel()
        
        viewModel.romaji.accept(self.selectedWord?.word_romaji ?? "")
        viewModel.hiragana.accept(self.selectedWord?.word_hiragana ?? "")
        viewModel.newID = self.selectedWord?.word_id ?? self.newID ?? ""
        
        controller.viewModel = viewModel
        presenter.pushViewController(controller, animated: true)
        self.addNewWordViewController = controller
    }
}

extension AddNewWordCoordinator: AddNewWordViewControllerDelegate {
    func addedNewWordModel(newWordModel: NewWordModel) {
        parentCoordinator?.updateNewWord(newWordModel: newWordModel)
    }
}
