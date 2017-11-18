//
//  EmplesGalleryView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxSwift

class EmplesGalleryView: UIViewController {
    
    //MARK: - Input
    public var viewModel :EmplesGalleryViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: GridViewDelegate = {
        var _delegate = GridViewDelegate(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: GridViewDataSource = {
        var _dataSource = GridViewDataSource(with: self.viewModel.galleryItems)
        return _dataSource
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = EmplesGalleryCollectionFlowLayout()
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.register(EmplesGridViewCell.self)
        view.delegate = delegate
        view.dataSource = dataSource
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collection)
        self.bindViewModel()
    }
    
    func bindViewModel() {
        self.title = viewModel.title
        viewModel.galleryItems.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.collection.reloadData()
            })
            .disposed(by: bag)
    }
}


