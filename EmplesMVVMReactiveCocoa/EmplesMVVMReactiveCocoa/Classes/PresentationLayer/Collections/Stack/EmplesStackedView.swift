//
//  EmplesStackedView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Koloda

class EmplesStackedView: BaseCollectionView {
    
    private lazy var stack: KolodaView = {
        var view = StackKolodaView(frame: self.view.bounds)
        view.countOfVisibleCards = 4
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.stack)
        self.bindViewModel()
        self.viewModel?.viewDidLoad()
    }
    
    func bindViewModel() {
        
        self.title = self.viewModel?.title
        self.stack.dataSource  = self.viewModel?.dataSource as? StackedViewSource
        self.stack.delegate = self.viewModel?.delegate as? StackedViewDelegate
        
        let disposable = self.viewModel?.loadItemsAction.observeResult {[weak self] (result) in
            if result.value != nil {
                self?.stack.reloadData()
            }
        }
        disposables.add(disposable)
    }
}

