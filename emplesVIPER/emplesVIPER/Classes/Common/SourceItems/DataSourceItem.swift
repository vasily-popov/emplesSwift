//
//  DataSourceItem.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

typealias DataSourceItemSelect = ((ViewCellModelProtocol, Int) -> Void)

struct DataSourceItem {
    let model :ViewCellModelProtocol
    let selectAction : DataSourceItemSelect?
    let rowHeight : CGFloat
    init(model:ViewCellModelProtocol, rowHeight:CGFloat = 60.0, _ selectAction:DataSourceItemSelect?) {
        self.model = model
        self.rowHeight = rowHeight
        self.selectAction = selectAction
    }
}

