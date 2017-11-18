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
    
    typealias T = EmplesMenuViewCell
    
    //MARK: - Input
    public var viewModel :EmplesMenuViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: GenericTableDelegate<T> = {
        var _delegate = GenericTableDelegate<T>(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: GenericTableDataSource<T> = {
        var _dataSource = GenericTableDataSource<T>(with: self.viewModel.menuItems)
        return _dataSource
    }()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.lightWhiteColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(T.self)
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
        print("resources: \(RxSwift.Resources.total)")
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

