//
//  EmplesGalleryView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesGalleryView: BaseCollectionView {
    
    private lazy var collection: UICollectionView = {
        let layout = EmplesGalleryCollectionFlowLayout()
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
        self.title = "Gallery".localized.localizedUppercase;
        self.view.addSubview(self.collection)
        self.collection.delegate = self.delegate
        self.collection.dataSource = self.dataSource
        self.collection.register(EmplesGridViewCell.self)
        self.presenter?.viewDidLoad()
    }
    
    private var __presenter: PresenterUICycleProtocol?
}

extension EmplesGalleryView :CollectionViewProtocol {
    
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
