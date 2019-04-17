//
//  NewWordTableViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 17/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit

class NewWordTableViewCell: UITableViewCell {

    static let Identifier = "NewWordTableViewCell"
    
    @IBOutlet weak var hiraganaLabel:       UILabel!
    @IBOutlet weak var romajiLabel:         UILabel!
    @IBOutlet weak var createdDateLabel:    UILabel!
    
    //Cell won't know about the model anymore
    var wordViewModel: NewWordCellViewModel! {
        didSet{
            hiraganaLabel.text      = wordViewModel.word_hiragana
            romajiLabel.text        = wordViewModel.word_romaji
            createdDateLabel.text   = wordViewModel.created_date
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
