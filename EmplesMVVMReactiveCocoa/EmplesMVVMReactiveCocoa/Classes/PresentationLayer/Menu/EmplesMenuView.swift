//
//  EmplesMenuView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class EmplesMenuView: UIViewController {
    
    public var viewModel :EmplesMenuViewModelProtocol!
    private lazy var table: UITableView = {
        var view = UITableView(frame: self.view.bounds, style: .plain)
        view.separatorStyle = .none
        view.backgroundColor = UIColor(named: ColorStrings.lightWhiteColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesMenuViewCell.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.table)
        self.bindViewModel()
    }
    
    func bindViewModel() {
        
        if let viewModel = viewModel {
            
            self.table.delegate = viewModel.delegate.value
            self.table.dataSource = viewModel.dataSource.value
            self.title = viewModel.title.value
            
            viewModel.reloadAction.on(value: {_ in
                self.table.reloadData()
            }).start()
        }
    }
}

