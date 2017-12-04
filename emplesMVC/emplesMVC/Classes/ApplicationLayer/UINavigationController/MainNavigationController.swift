//
//  MainNavigationController
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    convenience init() {
        self.init(nibName: nil, bundle: nil)
        delegate = self
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        delegate = self
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.visibleViewController?.supportedInterfaceOrientations ?? .all
    }
}

extension MainNavigationController : UINavigationControllerDelegate {
    static let kBackButton = "back-arrow"
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 1 {
            let image = UIImage(named: MainNavigationController.kBackButton)
            let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonClicked(_:)))
            viewController.navigationItem.leftBarButtonItem = backItem
            self.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
    }
    
    @objc func backButtonClicked(_ sender: Any) {
        popViewController(animated: true)
    }
}
