//
//  CustomTabBarView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

protocol CustomTabBarViewDelegate: AnyObject{
    func selectTabBarType(type: CustomTabBarView.TabBarType)
}

class CustomTabBarView: UIView{
    enum TabBarType{
        case home
        case wallet
        case cart
        case user
    }
    weak var delegate: CustomTabBarViewDelegate?
    private let homeBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 16).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    private lazy var homeTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 0
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.tintColor = .black
        let image = UIImage.tabHome().withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        return button
    }()
    private let walletBottomView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 16).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    private lazy var walletTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 1
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.tintColor = .tabbarUnselectColor()
        let image = UIImage.tabWallet().withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        return button
    }()
    private let cartBottomView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 16).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    private lazy var cartTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 2
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.tintColor = .tabbarUnselectColor()
        let image = UIImage.tabCart().withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        return button
    }()
    private let userBottomView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 16).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    private lazy var userTabButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 3
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.tintColor = .tabbarUnselectColor()
        let image = UIImage.tabUser().withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        return button
    }()
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .equalSpacing
        return sv
    }()
    @objc private func handleButton(button: UIButton){
        switch button.tag{
        case 1:
            delegate?.selectTabBarType(type: .wallet)
            homeTabButton.tintColor = .tabbarUnselectColor()
            homeBottomView.isHidden = true
            walletTabButton.tintColor = .black
            walletBottomView.isHidden = false
            cartTabButton.tintColor = .tabbarUnselectColor()
            cartBottomView.isHidden = true
            userTabButton.tintColor = .tabbarUnselectColor()
            userBottomView.isHidden = true
        case 2:
            delegate?.selectTabBarType(type: .cart)
            homeTabButton.tintColor = .tabbarUnselectColor()
            homeBottomView.isHidden = true
            walletTabButton.tintColor = .tabbarUnselectColor()
            walletBottomView.isHidden = true
            cartTabButton.tintColor = .black
            cartBottomView.isHidden = false
            userTabButton.tintColor = .tabbarUnselectColor()
            userBottomView.isHidden = true
        case 3:
            delegate?.selectTabBarType(type: .user)
            homeTabButton.tintColor = .tabbarUnselectColor()
            homeBottomView.isHidden = true
            walletTabButton.tintColor = .tabbarUnselectColor()
            walletBottomView.isHidden = true
            cartTabButton.tintColor = .tabbarUnselectColor()
            cartBottomView.isHidden = true
            userTabButton.tintColor = .black
            userBottomView.isHidden = false
        default:
            delegate?.selectTabBarType(type: .home)
            homeTabButton.tintColor = .black
            homeBottomView.isHidden = false
            walletTabButton.tintColor = .tabbarUnselectColor()
            walletBottomView.isHidden = true
            cartTabButton.tintColor = .tabbarUnselectColor()
            cartBottomView.isHidden = true
            userTabButton.tintColor = .tabbarUnselectColor()
            userBottomView.isHidden = true
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(stackView)
        stackView.addArrangedSubview(homeTabButton)
        stackView.addArrangedSubview(walletTabButton)
        stackView.addArrangedSubview(cartTabButton)
        stackView.addArrangedSubview(userTabButton)
        stackView.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 36, paddingBottom: 0, paddingRight: 36, width: 0, height: 20)
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(homeBottomView)
        homeBottomView.centerXAnchor.constraint(equalTo: homeTabButton.centerXAnchor).isActive = true
        homeBottomView.topAnchor.constraint(equalTo: homeTabButton.bottomAnchor,constant: 6).isActive = true
        addSubview(walletBottomView)
        walletBottomView.centerXAnchor.constraint(equalTo: walletTabButton.centerXAnchor).isActive = true
        walletBottomView.topAnchor.constraint(equalTo: walletTabButton.bottomAnchor,constant: 6).isActive = true
        addSubview(cartBottomView)
        cartBottomView.centerXAnchor.constraint(equalTo: cartTabButton.centerXAnchor).isActive = true
        cartBottomView.topAnchor.constraint(equalTo: cartTabButton.bottomAnchor,constant: 6).isActive = true
        addSubview(userBottomView)
        userBottomView.centerXAnchor.constraint(equalTo: userTabButton.centerXAnchor).isActive = true
        userBottomView.topAnchor.constraint(equalTo: userTabButton.bottomAnchor,constant: 6).isActive = true
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 80))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = CustomTabBarView()
            return view
        }
    }
}
