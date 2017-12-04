//
//  GenericGridViewDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class GenericGridViewDelegate: NSObject {
    
    private var dataSource: GenericGridViewSourceProtocol?
    
    convenience init(with source:GenericGridViewSourceProtocol) {
        self.init()
        self.dataSource = source
    }
    
    deinit {
        print("GenericGridViewDelegate deinit")
    }
}
extension GenericGridViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = self.dataSource!.elements[indexPath.row]
        row.selectAction?(row.model, indexPath.row)
    }
}
