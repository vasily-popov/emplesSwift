//
//  EmplesListView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesListView: BaseCollectionView {

    var model : EmplesListModelDecorator?
    
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    private lazy var dataSource:GenericTableViewSource = {
        var __dataSource = GenericTableViewSource(with: model?.dataSource)
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
        self.controller?.viewDidLoad()
    }
    
    private var __controller: ViewCollectionProtocol?
}

extension EmplesListView :EmplesCollectionViewProtocol {
    
    var controller: ViewCollectionProtocol? {
        get {
            return __controller
        }
        set {
            __controller = newValue
        }
    }
    
    func showData() {
        self.dataSource.setDataSource(self.model!.dataSource)
        self.table.reloadData()
    }
}
