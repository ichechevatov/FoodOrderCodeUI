//
//  MainCollectionReusableView.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 21.01.2021.
//

import UIKit

class MainCollectionReusableView: UICollectionReusableView {
    
    var label = UILabel()
    static let reuseIdentifier = MainCollectionReusableView.description()
    static let supplementaryViewOfKind = MainCollectionReusableView.description()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
