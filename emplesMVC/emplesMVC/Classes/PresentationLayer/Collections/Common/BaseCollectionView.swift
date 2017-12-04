//
//  BaseCollectionView.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/9/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class BaseCollectionView: UIViewController {

    lazy var progressView: EProgressView = {
        return EProgressView(frame: CGRect.zero)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navVC = self.navigationController {
            navVC.view.addSubview(self.progressView)
            self.progressView.translatesAutoresizingMaskIntoConstraints = false
            self.progressView.leftAnchor.constraint(equalTo: navVC.view.leftAnchor, constant: 0).isActive = true
            self.progressView.rightAnchor.constraint(equalTo: navVC.view.rightAnchor, constant: 0).isActive = true
            self.progressView.topAnchor.constraint(equalTo: navVC.view.topAnchor, constant: 0).isActive = true
            self.progressView.bottomAnchor.constraint(equalTo: navVC.view.bottomAnchor, constant: 0).isActive = true
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showProgressView() {
        //self.progressView.isHidden = false
    }
    
    func hideProgressView() {
        //self.progressView.isHidden = true
    }

}
