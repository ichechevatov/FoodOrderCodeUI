//
//  BadgeCollectionReusableView.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 01.02.2021.
//

import UIKit

class BadgeCollectionReusableView: UICollectionReusableView {
    let imageView = UIImageView()
    static let supplementaryViewOfKind = BadgeCollectionReusableView.description()
    static let reuseIdentifier = BadgeCollectionReusableView.description()
    
    func config(badgeImage: String){
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                                        imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                        imageView.centerYAnchor.constraint(equalTo: centerYAnchor)])
        
        imageView.image = UIImage(named: badgeImage)
        layer.masksToBounds = true
        layer.zPosition = 1
    }
}
