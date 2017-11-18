//
//  EmplesMenuView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift
import Then
//import RxDataSource

class EmplesMenuView: UIViewController {
    
    //MARK: - Input
    public var viewModel :EmplesMenuViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: MenuDelegate = {
        var _delegate = MenuDelegate(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: MenuDataSource = {
        var _dataSource = MenuDataSource(with: self.viewModel.menuItems)
        return _dataSource
    }()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.lightWhiteColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesMenuViewCell.self)
        view.delegate = delegate
        view.dataSource = dataSource
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.table)
        self.bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func bindViewModel() {
        self.title = viewModel.title
        viewModel.menuItems.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.table.reloadData()
            })
            .disposed(by: bag)
    }
}

