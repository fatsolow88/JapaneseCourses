//
//  AlphabetListViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 15/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol AlphabetListViewControllerDelegate: class {
    func alphabetListViewControllerDidSelectAlphabet(selectedModel: AlphabetModel)
}

class AlphabetListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    weak var delegate: AlphabetListViewControllerDelegate?
    
    private let disposeBag  = DisposeBag()
    
    let viewModel: AlphabetListViewControllerViewModel = AlphabetListViewControllerViewModel()

    var alphabet = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        viewModel.getAlphabets(alphabet: alphabet)
        
        collectionView?.register(UINib(nibName: "AlphabetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AlphabetCollectionViewCell.Identifier)

        bindViewModel()
        setupCellTapHandling()
        
        segmentedControl.rx.selectedSegmentIndex.subscribe (onNext: { index in
            self.selectedViewMode(index: index)
        }).disposed(by: disposeBag)

    }
    
    func bindViewModel() {
        viewModel.alphabetCells.bind(to: self.collectionView.rx.items) { collectionView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: AlphabetCollectionViewCell.Identifier, for: indexPath)  as? AlphabetCollectionViewCell else {
                return AlphabetCollectionViewCell()
            }
            cell.alphabetModel = element
            return cell
            
            }.disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func selectedViewMode(index: Int){
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(segmentedControl.selectedSegmentIndex == 0){
            return CGSize(width: 80, height: 80)
        }else if(segmentedControl.selectedSegmentIndex == 1){
            return CGSize(width: UIScreen.main.bounds.width, height: 80)
        }else{
            return CGSize(width: 80, height: 80)
        }
    }
}
