//
//  ViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 13/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var courseViewModels  = [CourseViewModel]()
    let dataSource  = BehaviorRelay(value: [CourseViewModel]())
    private let disposeBag  = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        courseViewModels.append(CourseViewModel(course: CourseModel(id:"course1", name: "Hiragana", numberOfLessons: 30)))
        courseViewModels.append(CourseViewModel(course: CourseModel(id:"course2", name: "Katakana", numberOfLessons: 50)))
        courseViewModels.append(CourseViewModel(course: CourseModel(id:"course3", name: "Kanji", numberOfLessons: 1000)))
        courseViewModels.append(CourseViewModel(course: CourseModel(id:"course4", name: "Keigo", numberOfLessons: 2000)))
        
        dataSource.accept(courseViewModels)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        tableView.register(UINib(nibName: "CourseTableViewCell", bundle: nil), forCellReuseIdentifier:  CourseTableViewCell.Identifier)
        
        self.dataSource.bind(to: self.tableView.rx.items(cellIdentifier: CourseTableViewCell.Identifier, cellType: CourseTableViewCell.self)) { index, model, cell in
            cell.courseViewModel = model
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(CourseModel.self)
            .subscribe(onNext: { [weak self] item in
                // other actions with Item object
//
//                if let selectedRowIndexPath = self?.tableView.indexPathForSelectedRow {
//                    self?.tableView.deselectRow(at: selectedRowIndexPath, animated: false)
//                }
//
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let controller = storyboard.instantiateViewController(withIdentifier: "MGEventDetailViewControllerSID") as? MGEventDetailViewController
//
//                self?.navigationController?.pushViewController(controller!, animated: true)
                
            }).disposed(by: disposeBag)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
