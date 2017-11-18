//
//  GridViewDelegate.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/18/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class GridViewDelegate: NSObject, UICollectionViewDelegate {
    
    private let source:GridViewDataSource!
    
    init(with source:GridViewDataSource) {
        self.source = source
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let model = source.items.value?[indexPath.row].model else { return }
        source.items.value?[indexPath.row].selectAction?(model, indexPath.row)
    }
}
