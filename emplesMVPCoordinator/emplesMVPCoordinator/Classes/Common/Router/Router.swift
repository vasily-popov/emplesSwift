//
//  RouterImpl.swift
//  emplesMVPCoordinator
//
//  Created by Vasily Popov on 1/5/18.
//  Copyright © 2018 Vasily Popov. All rights reserved.
//

import UIKit


protocol Presentable {
    func toPresentable() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresentable() -> UIViewController? {
        return self
    }
}


protocol RouterType: class, Presentable {
    
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    
    func present(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    func popModule(animated: Bool)
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable, hideBar: Bool)
    func popToRootModule(animated: Bool)
}

final public class Router: NSObject {
    
    private var completions: [UIViewController : () -> Void]
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    public let navigationController: UINavigationController
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }
    
    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension Router : RouterType {
    
    func toPresentable() -> UIViewController? {
        return navigationController
    }
    
    func present(_ module: Presentable, animated: Bool) {
        guard let controller = module.toPresentable() else { return }
        navigationController.present(controller, animated: animated, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        // Avoid pushing UINavigationController onto stack
        guard
            let controller = module.toPresentable(),
            controller is UINavigationController == false else { return }
        if let completion = completion {
            completions[controller] = completion
        }
        navigationController.pushViewController(controller, animated: animated)
    }
    
    func popModule(animated: Bool = true)  {
        
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func setRootModule(_ module: Presentable, hideBar: Bool) {
        guard let controller = module.toPresentable() else { return }
        navigationController.setViewControllers([controller], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }
}

extension Router : UINavigationControllerDelegate {
    
    static let kBackButton = "back-arrow"
    
    // MARK: UINavigationControllerDelegate
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        // Ensure the view controller is popping
        guard
            let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else { return }
        runCompletion(for: poppedViewController)
    }
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if self.navigationController.viewControllers.count > 1 {
            let image = UIImage(named: Router.kBackButton)
            let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonClicked(_:)))
            viewController.navigationItem.leftBarButtonItem = backItem;
            self.navigationController.interactivePopGestureRecognizer?.delegate = viewController as? UIGestureRecognizerDelegate
        }
    }
    
    @objc func backButtonClicked(_ sender: Any) {
        popModule(animated: true)
    }
}
