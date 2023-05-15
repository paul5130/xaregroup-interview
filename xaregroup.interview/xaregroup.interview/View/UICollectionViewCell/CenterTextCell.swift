//
//  CenterTextCell.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/15.
//

import UIKit
import SwiftUI
struct CenterTextCellViewModel{
    let text: String
    let isSelected: Bool
    init(text: String, isSelected: Bool = false) {
        self.text = text
        self.isSelected = isSelected
    }
}
class CenterTextCell: UICollectionViewCell{
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        layer.cornerRadius = 10
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CenterTextCell{
    func configure(_ model: CenterTextCellViewModel){
        label.text = model.text
        label.textColor = model.isSelected ? .white : .black
        backgroundColor = model.isSelected ? .black : .white
    }
}
