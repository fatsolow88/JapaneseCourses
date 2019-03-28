//
//  VocabTableViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 27/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class VocabTableViewCell: UITableViewCell {

    static let Identifier = "VocabTableViewCell"

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var hiraganaLabel: UILabel!
    @IBOutlet weak var romajiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var vocabViewModel: VocabViewModel! {
        didSet{
            //
            hiraganaLabel.text = vocabViewModel.vocab
            romajiLabel.text = vocabViewModel.romanization
        }
    }
}
