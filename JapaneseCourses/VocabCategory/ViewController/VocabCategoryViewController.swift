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

class VocabCategoryViewController: UIViewController,UICollectionViewDelegate {

    private let disposeBag  = DisposeBag()
    let viewModel: VocabCategoryViewControllerViewModel = VocabCategoryViewControllerViewModel()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(UINib(nibName: "VocabCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: VocabCategoryCollectionViewCell.Identifier)
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
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
