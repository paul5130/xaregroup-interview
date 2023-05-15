//
//  MainController.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/13.
//

import UIKit
import SwiftUI

class MainController: UIViewController {
    private lazy var customTabBarView: CustomTabBarView = {
        let view = CustomTabBarView()
        view.delegate = self
        return view
    }()
    private let containerView = UIView()
    private func removeInactiveViewController(inactiveViewController: UIViewController?){
        if let inActiveVC = inactiveViewController{
            inActiveVC.willMove(toParent: nil)
            inActiveVC.view.removeFromSuperview()
            inActiveVC.removeFromParent()
        }
    }
    private func updateActiveViewController(){
        if let activeVC = activeViewController{
            addChild(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParent: self)
        }
    }
    private var activeViewController: UIViewController?{
        didSet{
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    private let homeController: HomeController
    private let brandController: BrandController
    private let cartController = CartController()
    private let userController = UserController()
    init(homeController: HomeController,brandController: BrandController){
        self.homeController = homeController
        self.brandController = brandController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(customTabBarView)
        customTabBarView.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 80)
        activeViewController = homeController
    }
    
    
}
extension MainController: CustomTabBarViewDelegate{
    func selectTabBarType(type: CustomTabBarView.TabBarType) {
        switch type{
        case .home:
            activeViewController = homeController
        case .wallet:
            activeViewController = brandController
        case .cart:
            activeViewController = cartController
        case .user:
            activeViewController = userController
        }
    }
}
