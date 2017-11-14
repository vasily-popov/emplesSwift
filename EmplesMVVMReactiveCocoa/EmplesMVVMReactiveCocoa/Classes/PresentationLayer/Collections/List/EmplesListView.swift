//
//  EmplesListView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class EmplesListView: BaseCollectionView {
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesListCellView.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.table)
        self.bindViewModel()
        self.viewModel?.viewDidLoad()
    }
    
    func bindViewModel() {
        
        self.title = self.viewModel?.title
        self.table.dataSource  = self.viewModel?.dataSource as? UITableViewDataSource
        self.table.delegate = self.viewModel?.delegate as? UITableViewDelegate
        
        let disposable = self.viewModel?.loadItemsAction.observeResult {[weak self] (result) in
            if result.value != nil {
                self?.table.reloadData()
            }
        }
        disposables.add(disposable)

    }
    
}

