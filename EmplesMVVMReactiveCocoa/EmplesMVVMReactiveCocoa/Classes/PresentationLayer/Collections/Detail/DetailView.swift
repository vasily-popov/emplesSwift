//
//  DetailView
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailView: BaseCollectionView {

    var presenter: DetailPresenter?
    
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
        self.view.addSubview(self.table)
        self.table.delegate = self.delegate
        self.table.dataSource = self.dataSource
        self.table.register(DetailMapViewCell.self)
        self.table.register(DetailDescriptionViewCell.self)
        self.table.register(DetailDirectionTextViewCell.self)
        self.presenter?.viewDidLoad()
        
    }
    
    func setTitleLabel(_ title:String?) {
        self.title = title
    }
    
    func showSourceItems(_ items:Array<DataSourceItem>) {
        self.dataSource.setDataSource(items)
        self.table.reloadData()
    }
}

