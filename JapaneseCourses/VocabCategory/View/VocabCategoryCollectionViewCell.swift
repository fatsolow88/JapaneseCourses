//
//  VocabCategoryCollectionViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 28/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class VocabCategoryCollectionViewCell: UICollectionViewCell {

    static let Identifier = "VocabCategoryCollectionViewCell"
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var vocabCategoryViewModel: VocabCategoryViewModel! {
        didSet{
            categoryLabel.text = vocabCategoryViewModel.category_Name
        }
    }
}
