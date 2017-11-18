//
//  ListViewDelegate.swift
//  emplesMVVMRxSwift
//
//  Created by Vasily Popov on 11/18/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class ListViewDelegate: NSObject, UITableViewDelegate {
    
    private let source:ListViewDataSource!
    
    init(with source:ListViewDataSource) {
        self.source = source
        super.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return source.items.value![indexPath.row].rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = source.items.value?[indexPath.row].model else { return }
        source.items.value?[indexPath.row].selectAction?(model, indexPath.row)
    }
    
}
