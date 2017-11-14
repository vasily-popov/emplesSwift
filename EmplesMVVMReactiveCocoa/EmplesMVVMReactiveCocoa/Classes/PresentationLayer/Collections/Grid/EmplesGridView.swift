//
//  EmplesGridView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGridView: BaseCollectionView {
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2)
        layout.itemSize = CGSize(width: (self.view.bounds.size.width-8)/2, height: 150)
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesGridViewCell.self)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collection)
        self.bindViewModel()
        self.viewModel?.viewDidLoad()
    }
    
    func bindViewModel() {
        self.title = self.viewModel?.title
        self.collection.delegate = self.viewModel?.delegate as? GenericGridViewDelegate
        self.collection.dataSource = self.viewModel?.dataSource as? GenericGridViewSource
        let disposable = self.viewModel?.loadItemsAction.observeResult {[weak self] (result) in
            if result.value != nil {
                self?.collection.reloadData()
            }
        }
        disposables.add(disposable)
        
    }
}

