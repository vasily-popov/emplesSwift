//
//  EmplesCarouselView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import iCarousel
import RxSwift

class EmplesCarouselView: UIViewController {
    
    //MARK: - Input
    public var viewModel :EmplesCarouselViewModelProtocol!
    
    // MARK: - Init
    private let bag = DisposeBag()
    
    private lazy var delegate: CarouselViewDelegate = {
        var _delegate = CarouselViewDelegate(with: self.dataSource)
        return _delegate
    }()
    
    private lazy var dataSource: CarouselViewSource = {
        var _dataSource = CarouselViewSource(with: self.viewModel.carouselItems)
        return _dataSource
    }()
    
    private lazy var carousel: iCarousel = {
        var view = iCarousel(frame: self.view.bounds)
        view.type = .coverFlow2
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.delegate = delegate
        view.dataSource = dataSource
        return view
    }()
    
    func bindViewModel() {
        self.title = viewModel.title
        viewModel.carouselItems.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.carousel.reloadData()
            })
            .disposed(by: bag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: ColorStrings.emplesGreenColor)
        self.view.addSubview(self.carousel)
        self.bindViewModel()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.carousel.reloadData()
        })
    }

}
