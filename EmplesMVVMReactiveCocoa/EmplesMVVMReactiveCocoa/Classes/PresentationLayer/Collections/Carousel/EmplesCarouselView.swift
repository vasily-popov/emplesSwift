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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.carousel)
        self.bindViewModel()
        self.viewModel?.viewDidLoad()
    }
    
    func bindViewModel() {
        
        self.title = self.viewModel?.title
        self.carousel.dataSource  = self.viewModel?.dataSource as? iCarouselDataSource
        self.carousel.delegate = self.viewModel?.delegate as? iCarouselDelegate
        
        let disposable = self.viewModel?.loadItemsAction.observeResult {[weak self] (result) in
            if result.value != nil {
                self?.carousel.reloadData()
            }
        }
        disposables.add(disposable)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.carousel.reloadData()
        })
    }

}
