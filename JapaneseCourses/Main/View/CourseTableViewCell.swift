//
//  CourseTableViewCell.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 14/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit

class CourseTableViewCell: UITableViewCell {
    
    static let Identifier = "CourseTableViewCell"
    
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var coursesCountLabel: UILabel!
    
    //Cell won't know about the model anymore
    var courseViewModel: CourseViewModel! {
        didSet{
            courseNameLabel.text = courseViewModel.name
            coursesCountLabel.text = courseViewModel.numberOfLessonsString
        }
    }
}
