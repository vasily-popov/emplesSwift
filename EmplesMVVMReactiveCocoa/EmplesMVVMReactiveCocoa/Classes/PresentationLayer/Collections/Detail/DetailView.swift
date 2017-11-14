//
//  DetailView
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveSwift

class DetailView: UIViewController {

    var viewModel: DetailViewModel?
    private var disposables = CompositeDisposable()
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(DetailMapViewCell.self)
        view.register(DetailDescriptionViewCell.self)
        view.register(DetailDirectionTextViewCell.self)
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
        self.table.dataSource  = self.viewModel?.dataSource
        self.table.delegate = self.viewModel?.delegate
        
        let disposable = self.viewModel?.loadItemsAction.observeResult {[weak self] (result) in
            if result.value != nil {
                self?.table.reloadData()
            }
        }
        disposables.add(disposable)
        
    }
    
    deinit {
        disposables.dispose()
    }
}

