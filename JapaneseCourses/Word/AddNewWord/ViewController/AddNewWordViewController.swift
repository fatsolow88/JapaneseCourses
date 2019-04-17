//
//  AddNewWordViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 16/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

class AddNewWordViewController: UIViewController {

    @IBOutlet weak var textFieldRomaji: UITextField!
    @IBOutlet weak var textFieldHiragana: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    var viewModel: AddNewWordViewControllerViewModel?
    var updateFriends = PublishSubject<Void>()
    
    let disposeBag = DisposeBag()
    
    private var activeTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        
        title = viewModel.title.value
        
        bind(textField: textFieldRomaji, to: viewModel.romaji)
        bind(textField: textFieldHiragana, to: viewModel.hiragana)
        
        viewModel.submitButtonEnabled
            .bind(to: buttonSubmit.rx.isEnabled)
            .disposed(by: disposeBag)
        
        buttonSubmit.rx.tap.asObservable()
            .bind(to: viewModel.submitButtonTapped)
            .disposed(by: disposeBag)
        
        viewModel
            .onShowLoadingHud
            .map { [weak self] in self?.setLoadingHud(visible: $0) }
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel
            .onNavigateBack
            .subscribe(
                onNext: { [weak self] in
                    self?.updateFriends.onNext(())
                    let _ = self?.navigationController?.popViewController(animated: true)
                }
            ).disposed(by: disposeBag)
        
//        viewModel
//            .onShowError
//            .map { [weak self] in self?.presentSingleButtonDialog(alert: $0)}
//            .subscribe()
//            .disposed(by: disposeBag)
    }
    
    private func bind(textField: UITextField, to behaviorRelay: BehaviorRelay<String>) {
        //pre fill value
        behaviorRelay.asObservable()
            .bind(to: textField.rx.text)
            .disposed(by: disposeBag)
        
        //update value
        textField.rx.text.orEmpty
            .bind(to: behaviorRelay)
            .disposed(by: disposeBag)
    }
    
    private func setLoadingHud(visible: Bool) {
        PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
        visible ? PKHUD.sharedHUD.show(onView: view) : PKHUD.sharedHUD.hide()
    }
    
}

// MARK: - Actions
extension AddNewWordViewController {
    @IBAction func rootViewTapped(_ sender: Any) {
        activeTextField?.resignFirstResponder()
    }
}

// MARK: - UITextFieldDelegate
extension AddNewWordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
}
