//
//  EmplesCarouselView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import iCarousel

class EmplesCarouselView: BaseCollectionView {
    
    private lazy var carousel: iCarousel = {
        var view = iCarousel(frame: self.view.bounds)
        view.type = .coverFlow2
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }()
    
    private lazy var dataSource:CarouselViewSource = {
        var __dataSource = CarouselViewSource()
        return __dataSource
    }()
    
    private lazy var delegate:CarouselViewDelegate = {
        var __delegate = CarouselViewDelegate(with: self.dataSource)
        return __delegate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Carousel".localized.localizedUppercase;
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.carousel)
        self.carousel.delegate = self.delegate
        self.carousel.dataSource = self.dataSource
        self.presenter?.viewDidLoad()
    }
    
    private var __presenter: PresenterUICycleProtocol?
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.carousel.reloadData()
        })
    }

}

extension EmplesCarouselView :CollectionViewProtocol {
    
    var presenter: PresenterUICycleProtocol? {
        get {
            return __presenter
        }
        set {
            __presenter = newValue
        }
    }
    
    func showSourceItems(_ items:Array<Any>) {
        if let items = items as? Array<DataSourceItem> {
            self.dataSource.setDataSource(items)
            self.carousel.reloadData()
        }
    }
    
}
