//
//  EmplesStackedView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import Koloda
import RxSwift

class EmplesStackedView: UIViewController {
    
    //MARK: - Input
    public var viewModel :EmplesStackViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: StackedViewDelegate = {
        var _delegate = StackedViewDelegate(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: StackedViewSource = {
        var _dataSource = StackedViewSource(with: self.viewModel.stackItems)
        return _dataSource
    }()
    
    private lazy var stack: KolodaView = {
        var view = StackKolodaView(frame: self.view.bounds)
        view.countOfVisibleCards = 4
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.delegate = delegate
        view.dataSource = dataSource
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.stack)
        self.bindViewModel()
    }
    
    func bindViewModel() {
        self.title = viewModel.title
        viewModel.stackItems.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.stack.reloadData()
            })
            .disposed(by: bag)
    }
}

