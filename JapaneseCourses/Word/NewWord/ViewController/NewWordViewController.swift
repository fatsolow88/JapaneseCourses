//
//  NewWordViewController.swift
//  JapaneseCourses
//
//  Created by Low Wai Hong on 17/04/2019.
//  Copyright © 2019 Low Wai Hong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import PKHUD

protocol NewWordViewControllerDelegate: class {
    func newWordViewControllerDidSelectWord(selectedWord: NewWordCellViewModel)
}

class NewWordViewController: UIViewController, UITableViewDelegate, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: NewWordViewControllerDelegate?
    
    let viewModel: NewWordViewControllerViewModel = NewWordViewControllerViewModel()
    private let disposeBag  = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.register(UINib(nibName: "NewWordTableViewCell", bundle: nil), forCellReuseIdentifier:  NewWordTableViewCell.Identifier)
        
        bindViewModel()
        setupCellTapHandling()
        
        viewModel.getWords()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel.wordCells.bind(to: self.tableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
            case .normal(let viewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NewWordTableViewCell.Identifier, for: indexPath) as? NewWordTableViewCell else {
                    return UITableViewCell()
                }
                cell.wordViewModel = viewModel
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
        
        viewModel
            .onShowLoadingHud
            .map { [weak self] in self?.setLoadingHud(visible: $0) }
            .subscribe()
            .disposed(by: disposeBag)
    }

    private func setupCellTapHandling() {
        tableView
            .rx
            .modelSelected(NewWordTableViewCellType.self)
            .subscribe(
                onNext: { [weak self] wordCellType in
                    if case let .normal(viewModel) = wordCellType {
                        self?.delegate?.newWordViewControllerDidSelectWord(selectedWord: viewModel)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
