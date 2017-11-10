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
        return view
    }()
    
    private lazy var dataSource:GenericGridViewSource = {
        var __dataSource = GenericGridViewSource()
        return __dataSource
    }()
    
    private lazy var delegate:GenericGridViewDelegate = {
        var __delegate = GenericGridViewDelegate(with: self.dataSource)
        return __delegate
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Grid".localized.localizedUppercase;
        self.view.addSubview(self.collection)
        self.collection.delegate = self.delegate
        self.collection.dataSource = self.dataSource
        self.collection.register(EmplesGridViewCell.self)
        self.presenter?.viewDidLoad()
    }
    
    private var __presenter: PresenterUICycleProtocol?
}

extension EmplesGridView :CollectionViewProtocol {
    
    var presenter: PresenterUICycleProtocol? {
        get {
            return __presenter
        }
        set {
            __presenter = newValue
        }
    }
    
    func showSourceItems(_ items:Array<Any>) {
        if let items = items as? Array<DataGridSourceItem> {
            self.dataSource.setDataSource(items)
            self.collection.reloadData()
        }
    }

}
