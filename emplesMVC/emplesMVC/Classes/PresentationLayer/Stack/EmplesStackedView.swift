//
//  EmplesStackedView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ZLSwipeableView

class EmplesStackedView: BaseCollectionView {
    
    var model : EmplesListModelDecorator?
    
    private lazy var stack: ZLSwipeableView = {
        var view = ZLSwipeableView(frame: self.view.bounds)
        view.numberOfActiveViews = 4
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    private lazy var dataSource:StackedViewSource = {
        var __dataSource = StackedViewSource(with: model?.dataSource)
        return __dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Stack".localized.localizedUppercase;
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.stack)
        self.stack.dataSource = self.dataSource
        self.stack.viewAnimator = StackedViewAnimator()
        self.controller?.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        
        self.stack.discardAllViews()
        coordinator .animate(alongsideTransition: { (context) in
            self.stack.loadViewsIfNeeded()
        })
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
        self.stack.loadViewsIfNeeded()
    }
}
