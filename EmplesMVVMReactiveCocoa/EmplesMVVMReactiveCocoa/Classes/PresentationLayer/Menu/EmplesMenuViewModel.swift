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

protocol EmplesMenuViewModelProtocol {
    var title: Property<String?> {get}
    var delegate: Property<GenericTableViewDelegate?> {get}
    var dataSource: Property<GenericTableViewSource?> {get}
    var reloadAction: SignalProducer<Bool, NSError> {get}
}

class EmplesMenuViewModel :EmplesMenuViewModelProtocol {
    
    public weak var view :EmplesMenuView?
    public var router :EmplesMenuRouter?
    private var model: EmplesMenuModel!
    
    internal var title : Property<String?> { return Property(_title) }
    internal var dataSource: Property<GenericTableViewSource?> { return Property(_dataSource) }
    internal var delegate: Property<GenericTableViewDelegate?> { return Property(_delegate) }

    fileprivate lazy var _dataSource : MutableProperty<GenericTableViewSource?> = {
        return MutableProperty<GenericTableViewSource?>(GenericTableViewSource())
    }()
    fileprivate lazy var _delegate : MutableProperty<GenericTableViewDelegate?> = {
        return MutableProperty<GenericTableViewDelegate?>(GenericTableViewDelegate(with: _dataSource.value!))
    }()
    
    
    internal var reloadAction: SignalProducer<Bool, NSError> {
            return SignalProducer { observer, disposable in
                self.createSource()
                observer.send(value: true)
                observer.sendCompleted()
            }
    }
    
    fileprivate let _title = MutableProperty<String?>("Menu".lowercased())
    fileprivate let disposables = CompositeDisposable()
    fileprivate var selectScreenSignal: Signal<MenuScreen, NSError>
    fileprivate var selectScreenObserver: Signal<MenuScreen, NSError>.Observer

    
    required init(_ model: EmplesMenuModel) {
        self.model = model
        (selectScreenSignal, selectScreenObserver) = Signal<MenuScreen, NSError>.pipe()
        
        let disposable = selectScreenSignal.observeResult {[weak self] (result) in
            if let menu = result.value {
                self?.router?.navigate(item: menu)
            }
        }
        disposables.add(disposable)
    }
    
    func createSource() {
        
        self._dataSource.value?.elements += self.model.source.map { (text) -> DataSourceItem in
            let item = EmplesMenuCellModel()
            item.text = text
            return DataSourceItem(model: item, rowHeight: 50.0, { [weak self] (model, index) in
                if let screen = MenuScreen(rawValue: index) {
                    self?.selectScreenObserver.send(value: screen)
                }
            })
        }
    }
    
    deinit {
        disposables.dispose()
    }
}

