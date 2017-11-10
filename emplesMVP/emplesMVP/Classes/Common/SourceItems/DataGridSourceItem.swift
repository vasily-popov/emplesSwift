//
//  DataGridSourceItem.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

struct DataGridSourceItem {
    let model: ViewCellModelProtocol
    let selectAction: DataSourceItemSelect?
    let itemSize : CGSize
    init(model:ViewCellModelProtocol, itemSize:CGSize = CGSize(width: 50, height: 50), _ selectAction:DataSourceItemSelect?) {
        self.model = model
        self.itemSize = itemSize
        self.selectAction = selectAction
    }
}

