//
//  AlphabetCollectionViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 15/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class AlphabetCollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "AlphabetCollectionViewCell"
    
    @IBOutlet weak var textLabel : UILabel!
    @IBOutlet weak var romajiLabel: UILabel!
    
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
    
    var alphabetModel: AlphabetModel! {
        didSet{
            textLabel.text = alphabetModel.character
            romajiLabel.text = alphabetModel.romanization
        }
    }
}
