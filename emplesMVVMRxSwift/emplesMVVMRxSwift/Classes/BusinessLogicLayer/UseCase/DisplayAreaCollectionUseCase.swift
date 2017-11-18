//
//  DisplayAreaCollectionUseCase.swift
//  emplesVIPER
//
//  Created by Vasily Popov on 11/11/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import Foundation
import RxSwift

protocol DisplayAreaCollectionUseCase {

    func displayAreaCollection() -> Observable<[RecArea]>
    
}
