//
//  LatestShoesView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//


import UIKit
import SwiftUI

class LatestShoesView: UIView{
    private let cellId = "cellId"
    private let headerView = CellHeaderView()
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
        heightAnchor.constraint(equalToConstant: 260).isActive = true
        addSubview(headerView)
        headerView.configure(.init(text: "Latest shoes", showSeeMore: true))
        headerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(collectionView)
        collectionView.anchor(top: headerView.bottomAnchor, left: headerView.leftAnchor, bottom: bottomAnchor, right: headerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 156)
        collectionView.register(ShoeCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LatestShoesView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ShoeCell
//        cell.configure(items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
}
extension LatestShoesView: UICollectionViewDelegate{
    
}
extension LatestShoesView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 11) / 2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        11
    }
}
struct LatestShoesView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 260))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = LatestShoesView()
            return view
        }
    }
}
