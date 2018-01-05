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
    var model : DetailDirectionsCellModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension DetailDirectionTextViewCell : NibLoadableView {
    
}

extension DetailDirectionTextViewCell : ViewCellProtocol {
    
    func configureModel(_ newModel: ViewCellModelProtocol) {
        
        if let item = newModel as? DetailDirectionsCellModel {
            self.model = item;
            self.textView.text = self.model!.directionText
            self.textView.font = self.model!.font
            self.textView.textColor = self.model!.textColor
            
            self.contentView.backgroundColor = self.model!.bgColor;
        }
    }
}
