//
//  EProgressView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/8/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EProgressView: UIView {
    
    private lazy var indicator: UIActivityIndicatorView = {
        var item = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 40.0, height: 40.0))
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.color(fromHex: 0x6F7179, alpha: 0.5)
        self.addSubview(self.indicator)
        NSLayoutConstraint
            .activate([indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
                       indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)])
        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var isHidden: Bool {
        set {
            super.isHidden = newValue
            if (newValue) {
                self.indicator.stopAnimating();
            }
            else {
                self.indicator.startAnimating();
            }
        }
        get {
            return super.isHidden
        }
    }

    
}
