//
//  GridViewDataSource.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/18/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import RxCocoa

class GridViewDataSource: NSObject, UICollectionViewDataSource {
    
    let items: BehaviorRelay<[DataGridSourceItem]?>
    
    init(with source: BehaviorRelay<[DataGridSourceItem]?>) {
        self.items = source
        super.init()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return collectionView.dequeueCell(ofType: EmplesGridViewCell.self, indexPath:indexPath)
            .then { cell in
            cell.configure(items.value![indexPath.row].model)
        }
    }
}
