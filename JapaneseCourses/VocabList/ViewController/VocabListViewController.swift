//
//  VocabListViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 22/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class VocabListViewController: UIViewController {

    private let disposeBag  = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
//    weak var delegate: CourseListViewControllerDelegate?
    
    let viewModel: VocabListViewControllerViewModel = VocabListViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "VocabTableViewCell", bundle: nil), forCellReuseIdentifier:  VocabTableViewCell.Identifier)
        bindViewModel()
        setupCellTapHandling()
        
        viewModel.getVocabs()

    }
    
    func bindViewModel() {
        viewModel.vocabCells.bind(to: self.tableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: VocabTableViewCell.Identifier, for: indexPath) as? VocabTableViewCell else {
                    return UITableViewCell()
                }
                cell.vocabViewModel = viewModel
                return cell
            case .error(let message):
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = message
                return cell
            case .empty:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = "No data available"
                return cell
            }
            }.disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(VocabTableViewCellType.self)
            .subscribe(
                onNext: { [weak self] vocabCellType in
                    if case let .normal(viewModel) = vocabCellType {
//                        self?.delegate?.courseListViewControllerDidSelectCourse(selectedCourse: viewModel)
                    }
                    if let selectedRowIndexPath = self?.tableView.indexPathForSelectedRow {
                        self?.tableView?.deselectRow(at: selectedRowIndexPath, animated: true)
                    }
                }
            )
            .disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
