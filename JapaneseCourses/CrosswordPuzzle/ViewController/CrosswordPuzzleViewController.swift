//
//  CrosswordPuzzleViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 18/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit
import CrosswordsGenerator

//import RxCocoa
//import RxSwift

class CrosswordPuzzleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    private let disposeBag  = DisposeBag()
//
//    var hiraganaModels  = [HiraganaModel]()
//    let dataSource  = BehaviorRelay(value: [HiraganaModel]())
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generator = CrosswordsGenerator(columns: 10, rows: 10, maxLoops: 2000, words:  ["saffron", "pumpernickel", "leaven", "coda", "paladin", "syncopation", "albatross", "harp", "piston", "caramel", "coral", "dawn", "pitch", "fjord", "lip", "lime", "mist", "plague", "yarn", "snicker"])
        generator.generate()
//        let result = generator.result
        
        collectionView?.register(UINib(nibName: "CrosswordTextCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CrosswordTextCollectionViewCell.Identifier)
        collectionView?.register(UINib(nibName: "CrosswordBlackCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CrosswordBlackCollectionViewCell.Identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CrosswordTextCollectionViewCell.Identifier, for: indexPath) as! CrosswordTextCollectionViewCell
        
        return cell
    }
    
}
