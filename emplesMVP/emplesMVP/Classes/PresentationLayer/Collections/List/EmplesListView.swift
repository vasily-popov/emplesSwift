//
//  EmplesListView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListView: BaseCollectionView {
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    private lazy var dataSource:GenericTableViewSource = {
        var __dataSource = GenericTableViewSource()
        return __dataSource
    }()
    
    private lazy var delegate:GenericTableViewDelegate = {
        var __delegate = GenericTableViewDelegate(with: self.dataSource)
        return __delegate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List".localized.localizedUppercase;
        self.view.addSubview(self.table)
        self.table.delegate = self.delegate
        self.table.dataSource = self.dataSource
        self.table.register(EmplesListCellView.self)
        self.presenter?.viewDidLoad()
    }
    
    private var __presenter: PresenterUICycleProtocol?
    
    deinit {
        print("EmplesListView deinit")
    }
}

extension EmplesListView :CollectionViewProtocol {
    
    var presenter: PresenterUICycleProtocol? {
        get {
            return __presenter
        }
        set {
            __presenter = newValue
        }
    }
    
    func showSourceItems(_ items:Array<Any>) {
        if let items = items as? Array<DataSourceItem> {
            self.dataSource.setDataSource(items)
            self.table.reloadData()
        }
    }
}
