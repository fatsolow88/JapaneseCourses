//
//  CourseListViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 13/03/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

protocol CourseListViewControllerDelegate: class {
    func courseListViewControllerDidSelectCourse(selectedCourse: CourseViewModel)
}

class CourseListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    weak var delegate: CourseListViewControllerDelegate?
    
    let viewModel: CourseViewControllerViewModel = CourseViewControllerViewModel()
    private let disposeBag  = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CourseTableViewCell", bundle: nil), forCellReuseIdentifier:  CourseTableViewCell.Identifier)

        bindViewModel()
        setupCellTapHandling()
        
        viewModel.getCourses()
        
    }
    
    func bindViewModel() {
        viewModel.courseCells.bind(to: self.tableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.Identifier, for: indexPath) as? CourseTableViewCell else {
                    return UITableViewCell()
                }
                cell.courseViewModel = viewModel
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
        
//        viewModel
//            .onShowError
//            .map { [weak self] in self?.presentSingleButtonDialog(alert: $0)}
//            .subscribe()
//            .disposed(by: disposeBag)
        
        viewModel
            .onShowLoadingHud
            .map { [weak self] in self?.setLoadingHud(visible: $0) }
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(CourseTableViewCellType.self)
            .subscribe(
                onNext: { [weak self] courseCellType in
                    if case let .normal(viewModel) = courseCellType {
                        self?.delegate?.courseListViewControllerDidSelectCourse(selectedCourse: viewModel)
                    }
                    if let selectedRowIndexPath = self?.tableView.indexPathForSelectedRow {
                        self?.tableView?.deselectRow(at: selectedRowIndexPath, animated: true)
                    }
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func setLoadingHud(visible: Bool) {
        PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
        visible ? PKHUD.sharedHUD.show(onView: view) : PKHUD.sharedHUD.hide()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
