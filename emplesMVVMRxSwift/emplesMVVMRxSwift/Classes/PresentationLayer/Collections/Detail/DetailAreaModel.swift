//
//  EmplesDetailAreaModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import CoreLocation
import RxSwift

class DetailAreaModel {
    
    var titleName: String? {
        get {
            return self.model?.recAreaName
        }
    }
    
    let dataSource = Variable<[DataSourceItem]?>(nil)
    
    lazy var source: Array<DataSourceItem> = {
        let screenHeight = UIScreen.main.bounds.height
        var array = Array<DataSourceItem>()
        if let lat = self.model?.latitude, let long = self.model?.longitude {
            let coordinate = CLLocationCoordinate2DMake(Double(lat), Double(long))
            let item = DetailMapCellViewModel(coordinate)
            let row = DataSourceItem(model: item, rowHeight: screenHeight/3, nil)
            array.append(row)
        }
        if let areaDescription = self.model?.recAreaDescription {
            let item = DetailDescriptionCellViewModel()
            item.descriptionText = areaDescription
            item.imageURL = self.model?.imageURL
            let row = DataSourceItem(model: item, rowHeight: UITableViewAutomaticDimension, nil)
            array.append(row)
        }
        if let areaDirections = self.model?.recAreaDirections {
            let item = DetailDirectionsCellViewModel()
            item.directionText = areaDirections
            let row = DataSourceItem(model: item, rowHeight: UITableViewAutomaticDimension, nil)
            array.append(row)
        }
        return array
    }()
    
    var model: RecArea! {
        didSet {
            self.dataSource.value = source
        }
    }
    
    required init() {
    }

    convenience init(_ model: RecArea) {
        self.init()
        self.model = model
    }
}
