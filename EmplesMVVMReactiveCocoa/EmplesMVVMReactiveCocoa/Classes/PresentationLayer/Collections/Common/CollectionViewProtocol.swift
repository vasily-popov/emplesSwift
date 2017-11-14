//
//  CollectionViewProtocol
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

protocol CollectionViewProtocol : class {

    var viewModel :EmplesCollectionViewModelProtocol? {get set}
    func showProgressView()
    func hideProgressView()
}

