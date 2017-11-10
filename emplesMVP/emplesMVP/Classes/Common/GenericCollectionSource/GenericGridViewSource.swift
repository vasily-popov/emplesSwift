//
//  GenericGridViewSource.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

protocol GenericGridViewSourceProtocol {
    
    var elements: Array<DataGridSourceItem> {get}
}

class GenericGridViewSource: NSObject,GenericGridViewSourceProtocol {
    
    var elements: Array<DataGridSourceItem> = []
    
    convenience init(with source:Array<DataGridSourceItem>?) {
        self.init()
        if let source = source {
            self.elements += source
        }
    }
    
    public func setDataSource(_ dataSource:Array<DataGridSourceItem>) {
        self.elements = Array(dataSource)
    }
    
    public func appendItems(_ items:Array<DataGridSourceItem>) {
        self.elements += items
    }
}

extension GenericGridViewSource:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = self.elements[indexPath.row];
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: item.model.cellClassName, for: indexPath)
        if let cell = cell as? ViewCellProtocol {
            cell.configureModel(item.model)
        }
        return cell;
    }
    
}


