//
//  ShoesCellView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI
struct ShoesCellViewModel{
    let headerViewModel: CellHeaderViewModel
    let items: [ShoeCategoryCellViewModel]
}
class ShoesCellView: UIView{
    private let cellId = "cellId"
    private let headerView = CellHeaderView()
    private var items = [ShoeCategoryCellViewModel]()
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
        heightAnchor.constraint(equalToConstant: 220).isActive = true
        addSubview(headerView)
        headerView.configure(.init(text: "What's Popular", showSeeMore: true))
        headerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(collectionView)
        collectionView.anchor(top: headerView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        collectionView.register(ShoeCategoryCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(rightArrowLabel)
        rightArrowLabel.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 20, height: 20)
        rightArrowLabel.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ShoesCellView{
    func configure(_ model: ShoesCellViewModel){
        headerView.configure(model.headerViewModel)
        self.items = model.items
        DispatchQueue.main.async {        
            self.collectionView.reloadData()
        }
    }
}
extension ShoesCellView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ShoeCategoryCell
        cell.configure(items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
}
extension ShoesCellView: UICollectionViewDelegate{
    
}
extension ShoesCellView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 20 }
}
