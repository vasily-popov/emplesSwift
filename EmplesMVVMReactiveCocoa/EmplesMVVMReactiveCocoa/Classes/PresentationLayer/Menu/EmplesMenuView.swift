//
//  EmplesMenuView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class EmplesMenuView: UIViewController {
    
    public var viewModel :EmplesMenuViewModelProtocol!
    fileprivate var disposables = CompositeDisposable()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.lightWhiteColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesMenuViewCell.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.table)
        self.bindViewModel()
        self.viewModel.viewDidLoad()
    }
    
    func bindViewModel() {
        
        self.title = viewModel.title
        self.table.dataSource  = self.viewModel.dataSource
        self.table.delegate = self.viewModel.delegate
        let disposable = self.viewModel.reloadSignal.observeResult {[weak self] (result) in
            self?.table.reloadData()
        }
        disposables.add(disposable)
    }
    
    deinit {
        disposables.dispose()
    }
}

