//
//  BrandCellView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

class BrandCellView: UIView{
    private let cellId = "cellId"
    private let headerView = CellHeaderView()
    private let items: [CenterTextCellViewModel] = [
        .init(text: "adidas"),
        .init(text: "PUMA"),
        .init(text: "NIKE"),
        .init(text: "crocs"),
        .init(text: "SKECHERS"),
        .init(text: "Reebok")
    ]
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 250).isActive = true
        addSubview(headerView)
        headerView.configure(.init(text: "Select a Brand", showSeeMore: true))
        headerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(collectionView)
        collectionView.anchor(top: headerView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        collectionView.register(CenterTextCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension BrandCellView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CenterTextCell
        cell.configure(items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
}
extension BrandCellView: UICollectionViewDelegate{
    
}
extension BrandCellView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 15) / 2
        return CGSize(width: width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { 15 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { 15 }
}
struct BrandCellView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 250))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = BrandCellView()
            return view
        }
    }
}
