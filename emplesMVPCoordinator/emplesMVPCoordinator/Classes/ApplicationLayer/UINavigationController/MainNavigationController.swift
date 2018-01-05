//
//  MainNavigationController
//  emplesMVC
//
//  Created by Vasily Popov on 11/6/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override var shouldAutorotate: Bool {
        return true
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.visibleViewController?.supportedInterfaceOrientations ?? .all
    }
}

