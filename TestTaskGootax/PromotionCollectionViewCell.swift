//
//  PromotionCollectionViewCell.swift
//  TestTaskGootax
//
//  Created by Илья Че on 19.01.2021.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    static let reuseIdentifier = PromotionCollectionViewCell.description()
    
    func configure(banerName: String){
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        backgroundColor = .green
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        let image = UIImage(named: banerName)
        
        imageView.image = image
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            //imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}

