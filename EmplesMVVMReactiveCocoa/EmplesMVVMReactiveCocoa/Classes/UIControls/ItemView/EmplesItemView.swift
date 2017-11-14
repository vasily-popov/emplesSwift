//
//  EmplesItemView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class EmplesItemView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.brown.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
    }
    
    var viewModel: EmplesListCellModel! {
        didSet {
            titleLabel.text = viewModel.text
            titleLabel.font = viewModel.font
            titleLabel.textColor = viewModel.textColor
            backgroundColor = viewModel.bgColor
            
            if let url = viewModel.imageURL {
                iconView.kf.setImage(with: URL(string: url))
            }
        }
    }
}

extension EmplesItemView : NibLoadableView {

}

extension EmplesItemView : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? EmplesListCellModel {
            self.viewModel = item
        }
    }
}

