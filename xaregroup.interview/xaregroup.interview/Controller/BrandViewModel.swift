//
//  BrandViewModel.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/15.
//

import Foundation

class BrandViewModel{
    typealias Observer<T> = (T) -> Void
    private let service: ShoesService
    var getShoesCellViewModel: Observer<ShoesCellViewModel>?
    init(service: ShoesService) {
        self.service = service
    }
    func fetchData(){
        service.load { [weak self] result in
            switch result{
            case .success(let shoes):
                var shoesCategoryCellViewModel = [ShoeCategoryCellViewModel]()
                shoes.forEach { shoe in
                    shoesCategoryCellViewModel.append(ShoeCategoryCellViewModel(brand: "PUMA", type: shoe.name, price: "$ \(shoe.price)", imageUrl: shoe.image))
                }
                let shoesCellViewModel = ShoesCellViewModel(headerViewModel: .init(text: "What's Popular", showSeeMore: true), items: shoesCategoryCellViewModel)
                self?.getShoesCellViewModel?(shoesCellViewModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
