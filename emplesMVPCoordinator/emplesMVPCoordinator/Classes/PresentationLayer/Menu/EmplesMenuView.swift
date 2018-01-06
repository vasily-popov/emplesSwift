//
//  EmplesMenuView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol EmplesMenuViewProtocol {
    func setSource(_ source:Array<DataSourceItem>)
}

class EmplesMenuView: UIViewController {
    
    public var presenter :EmplesMenuPresenter!
     
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.lightWhiteColor)
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
        self.title = "Menu".localized.uppercased()
        self.view.addSubview(self.table)
        self.table.delegate = self.delegate
        self.table.dataSource = self.dataSource
        self.table.register(EmplesMenuViewCell.self)
        self.presenter.viewDidLoad()
    }
}
extension EmplesMenuView: EmplesMenuViewProtocol {
    func setSource(_ source:Array<DataSourceItem>) {
        dataSource.setDataSource(source)
        table.reloadData()
    }
}

