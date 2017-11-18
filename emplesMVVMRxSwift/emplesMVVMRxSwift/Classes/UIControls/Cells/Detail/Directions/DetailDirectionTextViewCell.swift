//
//  DetailDirectionTextViewCell.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class DetailDirectionTextViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: DetailDirectionsCellViewModel! {
        didSet {
            
            textView.text = viewModel.directionText
            textView.font = viewModel.font
            textView.textColor = viewModel.textColor

            contentView.backgroundColor = viewModel.bgColor
        }
    }
}

extension DetailDirectionTextViewCell : NibLoadableView {
    
}

extension DetailDirectionTextViewCell : ConfigurableCell {
    
    func configure(_ model: ViewCellModelProtocol) {
        
        if let item = model as? DetailDirectionsCellViewModel {
            self.viewModel = item;
        }
    }
}
