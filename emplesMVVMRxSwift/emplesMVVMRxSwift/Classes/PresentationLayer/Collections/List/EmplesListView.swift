//
//  EmplesListView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EmplesListView: UIViewController {
    
    typealias T = EmplesListCellView
    
    //MARK: - Input
    public var viewModel :EmplesListViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: GenericTableDelegate<T> = {
        var _delegate = GenericTableDelegate<T>(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: GenericTableDataSource<T> = {
        var _dataSource = GenericTableDataSource<T>(with: self.viewModel.listItems)
        return _dataSource
    }()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
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
    
    func bindViewModel() {
        self.title = viewModel.title
        viewModel.listItems.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.table.reloadData()
            })
            .disposed(by: bag)
    }
}

