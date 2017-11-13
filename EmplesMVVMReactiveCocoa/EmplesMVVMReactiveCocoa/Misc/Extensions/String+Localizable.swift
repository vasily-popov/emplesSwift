//
//  String+Localizable.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
