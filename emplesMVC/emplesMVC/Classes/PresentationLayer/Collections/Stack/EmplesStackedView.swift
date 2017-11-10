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
    
    var model : EmplesListModelDecorator?
    
    
    private lazy var stack: KolodaView = {
        var view = StackKolodaView(frame: self.view.bounds)
        view.countOfVisibleCards = 4
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    private lazy var dataSource:StackedViewSource = {
        var __dataSource = StackedViewSource(with: model?.dataSource)
        return __dataSource
    }()
    
    private lazy var delegate:StackedViewDelegate = {
        var __delegate = StackedViewDelegate(with: self.dataSource)
        return __delegate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stack".localized.localizedUppercase;
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.stack)
        self.stack.dataSource = self.dataSource
        self.stack.delegate = self.delegate
        self.controller?.viewDidLoad()
    }
    
    private var __controller: ViewCollectionProtocol?
}

extension EmplesStackedView :EmplesCollectionViewProtocol {
    
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
        self.stack.reloadData()
    }
}
