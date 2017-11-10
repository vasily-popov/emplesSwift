//
//  GenericTableViewDelegate.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class GenericTableViewDelegate: NSObject {
    
    private var dataSource: GenericTableViewSourceProtocol?
    
    convenience init(with source:GenericTableViewSourceProtocol) {
        self.init()
        self.dataSource = source
    }
}
extension GenericTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.dataSource!.elements[indexPath.row]
        return row.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.dataSource!.elements[indexPath.row]
        row.selectAction?(row.model, indexPath.row)
    }
}
