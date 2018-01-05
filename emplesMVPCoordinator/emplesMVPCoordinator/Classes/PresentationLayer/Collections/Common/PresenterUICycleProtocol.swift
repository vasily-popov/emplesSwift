//
//  PresenterUICycleProtocol
//  emplesMVP
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation

protocol PresenterUICycleProtocol {
    
    var onItemSelected: ((RecArea) -> ())? {get set}
    var onShowError: ((String) -> ())? {get set}
    
    func viewDidLoad()
}
