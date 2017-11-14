//
//  EmplesMenuPresenter
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

protocol EmplesMenuViewModelProtocol:LifeCycleProtocol {
    var title: String {get}
    var dataSource: GenericTableViewSource? {get}
    var delegate: GenericTableViewDelegate? {get}
    var reloadSignal: Signal<Bool, NSError> {get}
}

class EmplesMenuViewModel :EmplesMenuViewModelProtocol {
    
    public weak var view :EmplesMenuView?
    public var router :EmplesMenuRouter?
    private var model: EmplesMenuModel!
    
    internal var title = "Menu".uppercased()
    internal var dataSource: GenericTableViewSource?
    internal var delegate: GenericTableViewDelegate?
    internal var reloadSignal: Signal<Bool, NSError>
    
    private var selectScreenSignal: Signal<MenuScreen, NSError>
    private var reloadSignalObserver: Signal<Bool, NSError>.Observer
    private var selectScreenSignalObserver: Signal<MenuScreen, NSError>.Observer
    fileprivate var disposables = CompositeDisposable()
    
    required init(_ model: EmplesMenuModel) {
        self.model = model
        self.dataSource = GenericTableViewSource()
        self.delegate = GenericTableViewDelegate(with: self.dataSource!)
        
        (reloadSignal, reloadSignalObserver) = Signal<Bool, NSError>.pipe()
        (selectScreenSignal, selectScreenSignalObserver) = Signal<MenuScreen, NSError>.pipe()
        
        let disposable = selectScreenSignal.observeResult {[weak self] (result) in
            if let menu = result.value {
                self?.router?.navigate(item: menu)
            }
        }
        disposables.add(disposable)
    }
    
    func viewDidLoad() {
        self.dataSource?.setDataSource(self.buildedSource)
        reloadSignalObserver.send(value: true)
    }
    
    lazy var buildedSource:Array<DataSourceItem> = {
        return self.model.source.map({ (text) -> DataSourceItem in
            let item = EmplesMenuCellModel()
            item.text = text
            return DataSourceItem(model: item, rowHeight: 50.0, { [weak self] (model, index) in
                if let screen = MenuScreen(rawValue: index) {
                    self?.selectScreenSignalObserver.send(value: screen)
                }
            })
        })
    }()
    
    
    deinit {
        disposables.dispose()
    }
}

/*
 self.reloadSignal = Signal { [weak self] (observable) -> Disposable? in
 if let wSelf = self {
 wSelf.dataSource?.setDataSource(wSelf.buildedSource)
 observable.send(value: true)
 observable.sendCompleted()
 }
 return nil
 }
 */
/*
 self.reloadSignal = SignalProducer { [weak self] (observer: Signal.Observer, _) -> () in
 self?.dataSource?.setDataSource(self?.buildedSource)
 observer.send(value: true)
 observer.sendCompleted()
 }
 */

