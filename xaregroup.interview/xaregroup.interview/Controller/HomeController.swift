//
//  HomeController.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/13.
//

import UIKit
import SwiftUI

class HomeController: UIViewController{
    private let categoryCellView = CategoryCellView()
    private let brandCellView = BrandCellView()
    private let shoesCellView = ShoesCellView()
    private let latestShoesView = LatestShoesView()
    private let scrollView = UIScrollView()
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    private func createEmptyView(height: CGFloat) -> UIView{
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        stackView.addArrangedSubview(categoryCellView)
        stackView.addArrangedSubview(brandCellView)
        shoesCellView.configure(ShoesCellViewModel(headerViewModel: .init(text: "What's Popular", showSeeMore: true), items: [
            .init(brand: "Adidas", type: "Yung - I", price: "128.99", imageUrl: ""),
            .init(brand: "Nike", type: "Free Metcon", price: "120.99", imageUrl: "")
        ]))
        stackView.addArrangedSubview(shoesCellView)
        stackView.addArrangedSubview(latestShoesView)
        stackView.addArrangedSubview(createEmptyView(height: 100))
        stackView.addArrangedSubview(UIView())
    }
}
struct HomeController_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView()
    }
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            HomeController()
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }
}
