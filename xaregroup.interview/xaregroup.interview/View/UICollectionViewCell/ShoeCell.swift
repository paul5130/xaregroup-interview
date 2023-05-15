//
//  ShoeCell.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

class ShoeCell: UICollectionViewCell{
    private let heartImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .heart()
        return iv
    }()
    private let shoeImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .nikeShoe()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .grayBackgroundColor()
        addSubview(shoeImageView)
        shoeImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        addSubview(heartImageView)
        heartImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 20, height: 20)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct ShoeCell_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 156, height: 156))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = ShoeCell()
            return view
        }
    }
}
