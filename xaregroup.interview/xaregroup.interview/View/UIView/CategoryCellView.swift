//
//  CategoryCellView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

class CategoryCellView: UIView{
    private let cellId = "cellId"
    private let headerView = CellHeaderView()
    private var items: [CategoryCell.Gender] = [
        .women,.men,.women
    ]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    private let rightArrowLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.text = ">"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        headerView.configure(.init(text: "Choose a Category", showSeeMore: false))
        headerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(collectionView)
        collectionView.anchor(top: headerView.bottomAnchor, left: headerView.leftAnchor, bottom: bottomAnchor, right: headerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(rightArrowLabel)
        rightArrowLabel.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 20, height: 20)
        rightArrowLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CategoryCellView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.configure(items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
}
extension CategoryCellView: UICollectionViewDelegate{
    
}
extension CategoryCellView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        14
    }
}
struct CategoryCellView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 170))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = CategoryCellView()
            return view
        }
    }
}
