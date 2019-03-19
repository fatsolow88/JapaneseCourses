//
//  HiraganaListViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 15/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class HiraganaListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private let disposeBag  = DisposeBag()

    var hiraganaModels  = [HiraganaModel]()
    let dataSource  = BehaviorRelay(value: [HiraganaModel]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "hiragana", ofType: "json") {
            let hiraganaArray = try! JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: path)), options: JSONSerialization.ReadingOptions()) as? [[String : String]]
            
            for hiraganaDict in hiraganaArray! {
                hiraganaModels.append(HiraganaModel(char_id: hiraganaDict["char_id"] ?? "", character: hiraganaDict["character"] ?? "", romanization: hiraganaDict["romanization"] ?? ""))
            }
            
        }
        
        dataSource.accept(hiraganaModels)

        collectionView?.register(UINib(nibName: "HiraganaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: HiraganaCollectionViewCell.Identifier)

        dataSource.asObservable().bind(to:collectionView.rx.items(cellIdentifier: HiraganaCollectionViewCell.Identifier, cellType: HiraganaCollectionViewCell.self)) { row, data, cell in
                cell.hiraganaModel = data
            }.disposed(by: disposeBag)
        
        // add this line you can provide the cell size from delegate method
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        segmentedControl.rx.selectedSegmentIndex.subscribe (onNext: { index in
            self.selectedViewMode(index: index)
        }).disposed(by: disposeBag)

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