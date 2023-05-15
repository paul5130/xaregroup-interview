//
//  HeaderView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//


import UIKit
import SwiftUI

class HeaderView: UIView{
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .blackBackgroundColor()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    private let label1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .grayTextColor()
        label.text = "Just do it"
        return label
    }()
    private let label2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .grayTextColor()
        label.text = "with"
        return label
    }()
    private let nikeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.text = "Nike"
        return label
    }()
    private let addToCartButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 30))
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10,weight: .semibold)
        button.setTitle("Add to Cart", for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    private let nikeLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .rgb(red: 70, green: 64, blue: 64)
        iv.image = .nikeLogo().withRenderingMode(.alwaysTemplate)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    private let shoeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .nikeShoe()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 180).isActive = true
        addSubview(backgroundView)
        backgroundView.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 160)
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(label1)
        label1.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 32, paddingLeft: 40, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(label2)
        label2.anchor(top: label1.bottomAnchor, left: label1.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(nikeLabel)
        nikeLabel.anchor(top: label1.bottomAnchor, left: label2.rightAnchor, bottom: nil, right: nil, paddingTop: 1, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(addToCartButton)
        addToCartButton.anchor(top: label2.bottomAnchor, left: label2.leftAnchor, bottom: nil, right: nil, paddingTop: 13, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 90, height: 30)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.linearGradientColor1().cgColor,
            UIColor.linearGradientColor2().cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.frame = addToCartButton.bounds
        addToCartButton.layer.insertSublayer(gradientLayer, at: 0)
        addSubview(nikeLogoImageView)
        nikeLogoImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 18, width: 180, height: 100)
        nikeLogoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(shoeImageView)
        shoeImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 18, width: 200, height: 0)
        shoeImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor,constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 180))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = HeaderView()
            return view
        }
    }
}
