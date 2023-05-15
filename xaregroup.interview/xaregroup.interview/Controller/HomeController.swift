//
//  HomeController.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/13.
//

import UIKit

class HomeController: UIViewController{
    private let viewModel: HomeViewModel
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
    init(viewModel: HomeViewModel){
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
        stackView.addArrangedSubview(categoryCellView)
        stackView.addArrangedSubview(brandCellView)
        shoesCellView.isHidden = true
        stackView.addArrangedSubview(shoesCellView)
        stackView.addArrangedSubview(latestShoesView)
        stackView.addArrangedSubview(createEmptyView(height: 100))
        stackView.addArrangedSubview(UIView())
        setupObserver()
    }
    private func setupObserver(){
        viewModel.fetchData()
        viewModel.getShoesCellViewModel = { [weak self] getShoesCellViewModel in
            self?.shoesCellView.configure(getShoesCellViewModel)
            DispatchQueue.main.async {
                self?.shoesCellView.isHidden = false
            }
        }
    }
}
