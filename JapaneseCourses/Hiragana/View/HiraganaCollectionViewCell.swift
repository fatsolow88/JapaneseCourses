//
//  HiraganaCollectionViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 15/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class HiraganaCollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "HiraganaCollectionViewCell"
    
    @IBOutlet weak var textLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.lightText.cgColor
    }
    
    func commonInit(){
        
    }
    
    var hiraganaModel: HiraganaModel! {
        didSet{
            textLabel.text = hiraganaModel.character
        }
    }
}
