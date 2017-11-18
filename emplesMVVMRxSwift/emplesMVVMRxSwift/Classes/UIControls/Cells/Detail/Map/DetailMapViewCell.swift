//
//  DetailMapViewCell.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailMapViewCell: UITableViewCell {
    
    static let zoom :Float = 11.0
    
    private lazy var map: GMSMapView = {
        let __map = GMSMapView(frame: CGRect.zero)
        __map.isBuildingsEnabled = false
        __map.isIndoorEnabled = false
        __map.translatesAutoresizingMaskIntoConstraints = false
        return __map
    }()
    
    var viewModel: DetailMapCellViewModel! {
        didSet {
            updateMap(viewModel!.coordinate);
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.map)
        self.setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.map.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.map.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        self.map.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.map.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func updateMap(_ coordinate:CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = coordinate;
        marker.map = self.map;
        
        self.map.camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude,
                                                   longitude: coordinate.longitude,
                                                   zoom: DetailMapViewCell.zoom)
    }
}



extension DetailMapViewCell : ViewCellProtocol {
    
    func update(with model: ViewCellModelProtocol) {
        
        if let item = model as? DetailMapCellViewModel {
            self.viewModel = item;
        }
    }
}
