//
//  CellHeaderView.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit
import SwiftUI

struct CellHeaderViewModel{
    let text: String
    let showSeeMore: Bool
}
class CellHeaderView: UIView{
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    private let seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blackBackgroundColor()
        button.titleLabel?.font = .systemFont(ofSize: 10,weight: .bold)
        button.setTitle("See more", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 66).isActive = true
        addSubview(label)
        label.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 18, paddingBottom: 18, paddingRight: 0, width: 0, height: 0)
        addSubview(seeMoreButton)
        seeMoreButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 20, width: 70, height: 20)
        seeMoreButton.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CellHeaderView{
    func configure(_ model: CellHeaderViewModel){
        DispatchQueue.main.async {
            self.label.text = model.text
            self.seeMoreButton.isHidden = !model.showSeeMore
        }
    }
}
struct CellHeaderView_Previews: PreviewProvider {
    static var previews: some View{
        ContainerView().previewLayout(.fixed(width: 375, height: 66))
    }
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
        func makeUIView(context: Context) -> some UIView {
            let view = CellHeaderView()
            view.configure(CellHeaderViewModel(text: "Choose a Category", showSeeMore: true))
            return view
        }
    }
}
