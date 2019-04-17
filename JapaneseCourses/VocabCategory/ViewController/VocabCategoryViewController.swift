//
//  VocabCategoryViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol VocabCategoryViewControllerDelegate: class {
    func vocabCategoryViewControllerDidSelectCategory(selectedModel: VocabCategoryViewModel)
}

class VocabCategoryViewController: UIViewController,UICollectionViewDelegate {

    private let disposeBag  = DisposeBag()
    let viewModel: VocabCategoryViewControllerViewModel = VocabCategoryViewControllerViewModel()

    weak var delegate: VocabCategoryViewControllerDelegate?

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UINib(nibName: "VocabCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: VocabCategoryCollectionViewCell.Identifier)
        
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        // Set the PinterestLayout delegate
        if let layout = collectionView?.collectionViewLayout as? VocabCategoryLayout {
            layout.delegate = self
        }
        
        bindViewModel()
        setupCellTapHandling()
        
        // Do any additional setup after loading the view.
        viewModel.getVocabCategory()
    }
    
    func bindViewModel() {
        viewModel.vocabCategoryCells.bind(to: self.collectionView.rx.items) { collectionView, index, element in
            let indexPath = IndexPath(item: index, section: 0)

            switch element {
            case .normal(let viewModel):
                guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: VocabCategoryCollectionViewCell.Identifier, for: indexPath) as? VocabCategoryCollectionViewCell else {
                    return VocabCategoryCollectionViewCell()
                }
                cell.vocabCategoryViewModel = viewModel
                return cell
            case .error(let message):
                let cell = UICollectionViewCell()
                cell.isUserInteractionEnabled = false
//                cell.textLabel?.text = message
                return cell
            case .empty:
                let cell = UICollectionViewCell()
                cell.isUserInteractionEnabled = false
//                cell.textLabel?.text = "No data available"
                return cell
            }
            }.disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        
        collectionView
            .rx
            .modelSelected(VocabCategoryCollectionViewCellType.self)
            .subscribe(
                onNext: { [weak self] courseCellType in
                    if case let .normal(viewModel) = courseCellType {
                        self?.delegate?.vocabCategoryViewControllerDidSelectCategory(selectedModel: viewModel)
                    }
                }
            )
            .disposed(by: disposeBag)
    }
}

//MARK: - LAYOUT DELEGATE
extension VocabCategoryViewController : VocabCategoryLayoutDelegate {
    
    // 1. Returns the height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        let number = Int.random(in: 10 ... 20)
        
        return  CGFloat(number * 10)
    }
    
}
