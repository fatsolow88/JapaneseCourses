//
//  CrosswordBlackCollectionViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 18/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class CrosswordBlackCollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "CrosswordBlackCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.lightText.cgColor
    }
}
