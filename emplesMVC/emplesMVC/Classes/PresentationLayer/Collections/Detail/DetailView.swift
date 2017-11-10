//
//  DetailView
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailView: BaseCollectionView {

    var model : DetailAreaModel?
    var controller: DetailController?
    
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
        self.title = model?.titleName;
        self.view.addSubview(self.table)
        self.table.delegate = self.delegate
        self.table.dataSource = self.dataSource
        self.table.register(DetailMapViewCell.self)
        self.table.register(DetailDescriptionViewCell.self)
        self.table.register(DetailDirectionTextViewCell.self)
        if let source = self.model?.dataSource {
            self.dataSource.setDataSource(source)
            self.table.reloadData()
        }
    }
}

