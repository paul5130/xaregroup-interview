//
//  ShoeCategoryCell.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

struct ShoeCategoryCellViewModel{
    let brand: String
    let type: String
    let price: String
    let imageUrl: String
}

class ShoeCategoryCell: UICollectionViewCell{
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        return label
    }()
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .rgb(red: 0, green: 0, blue: 0,alpha: 0.29)
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    private let nikeLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .rgb(red: 220, green: 220, blue: 220)
        iv.image = .nikeLogo().withRenderingMode(.alwaysTemplate)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    private let shoeImageView: UIImageView = {
        let iv = UIImageView()
//        iv.image = .nikeShoe().rotate(radians: 50)
        iv.image = .nikeShoe()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .grayBackgroundColor()
        addSubview(brandLabel)
        brandLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 32, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(typeLabel)
        typeLabel.anchor(top: brandLabel.bottomAnchor, left: brandLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 6, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(priceLabel)
        priceLabel.anchor(top: typeLabel.bottomAnchor, left: typeLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(nikeLogoImageView)
        nikeLogoImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 180, height: 100)
        nikeLogoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        addSubview(shoeImageView)
        shoeImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 180, height: 0)
        shoeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        layer.cornerRadius = 14
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ShoeCategoryCell{
    func configure(_ model: ShoeCategoryCellViewModel){
        brandLabel.text = model.brand
        typeLabel.text = model.type
        priceLabel.text = model.price
//        if let url = URL(string: model.imageUrl){
//            shoeImageView.load(url: url)
//        }
    }
}
struct ShoeCategoryCell_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 300, height: 140))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = ShoeCategoryCell()
            view.configure(ShoeCategoryCellViewModel(brand: "Adidas", type: "Yung - I", price: "$ 120.99", imageUrl: ""))
            return view
        }
    }
}
