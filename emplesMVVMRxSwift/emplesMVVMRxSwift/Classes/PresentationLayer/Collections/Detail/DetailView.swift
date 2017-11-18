//
//  DetailView
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

class DetailView: UIViewController {
    
    //MARK: - Input
    public var viewModel :DetailViewModel!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: DetailListViewDelegate = {
        var _delegate = DetailListViewDelegate(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: DetailListViewDataSource = {
        var _dataSource = DetailListViewDataSource(with: self.viewModel.listItems)
        return _dataSource
    }()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(DetailMapViewCell.self)
        view.register(DetailDescriptionViewCell.self)
        view.register(DetailDirectionTextViewCell.self)
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

