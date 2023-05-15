//
//  BrandController.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/13.
//

import UIKit
import SwiftUI

class BrandController: UIViewController{
    private let viewModel: BrandViewModel
    private let headerView = HeaderView()
    private let headerBottomView = HeaderBottomView()
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
    init(viewModel: BrandViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.addSubview(stackView)
        stackView.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(createEmptyView(height: 15))
        stackView.addArrangedSubview(headerBottomView)
        stackView.addArrangedSubview(shoesCellView)
        shoesCellView.isHidden = true
        stackView.addArrangedSubview(latestShoesView)
        stackView.addArrangedSubview(createEmptyView(height: 100))
        stackView.addArrangedSubview(UIView())
        setupObserver()
    }
    private func setupObserver(){
        viewModel.fetchData()
        viewModel.getShoesCellViewModel = { [weak self] getShoesCellViewModel in
            self?.shoesCellView.configure(getShoesCellViewModel)
            var imageUrls = [URL]()
            getShoesCellViewModel.items.forEach { cellVM in
                if let url = URL(string: cellVM.imageUrl){
                    imageUrls.append(url)
                }
            }
            self?.latestShoesView.configure(items: imageUrls)
            DispatchQueue.main.async {
                self?.shoesCellView.isHidden = false
            }
        }
    }
}
