//
//  CategoryCell.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI


class CategoryCell: UICollectionViewCell{
    enum Gender{
        case men
        case women
    }
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15,weight: .bold)
        return label
    }()
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    private func setGradient() {
        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 80))
        addSubview(gradientView)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.linearGradientColor1().cgColor,
            UIColor.linearGradientColor2().cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupViews() {
        addSubview(label)
        label.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 55, height: 0)
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 0, paddingBottom: 10, paddingRight: 16, width: 60, height: 0)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradient()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryCell{
    func configure(_ gender: Gender){
        switch gender{
        case .women:
            label.text = "Women"
            imageView.image = .woman()
        case .men:
            label.text = "Men"
            imageView.image = .man()
        }
    }
}
struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 150, height: 80))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = CategoryCell()
            view.configure(.men)
            return view
        }
    }
}
