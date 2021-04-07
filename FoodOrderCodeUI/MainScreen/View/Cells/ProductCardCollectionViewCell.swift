//
//  ProductCardCollectionViewCell.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 21.01.2021.
//

import UIKit

class ProductCardCollectionViewCell: UICollectionViewCell {
    var productImageView = UIImageView()
    var productNameLabel = UILabel()
    var productPriceLabel = UILabel()
    var productWeightLabel = UILabel()
    
    static let reuseIdentifier = ProductCardCollectionViewCell.description()
    
    func configure(imageName: String, productName: String, productPrice: String, productWeght: String, badge: String?) {
        productImageView.image = UIImage(named: imageName)
        productNameLabel.text = productName
        productPriceLabel.text = productPrice + " ₽"
        productWeightLabel.text = productWeght + " г"
        
        productNameLabel.font = UIFont.systemFont(ofSize: 14)
        productNameLabel.numberOfLines = 2
        productPriceLabel.font = UIFont.systemFont(ofSize: 14)
        productWeightLabel.font = UIFont.systemFont(ofSize: 14)
        productWeightLabel.textColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
           
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leftAnchor.constraint(equalTo: leftAnchor),
            productImageView.rightAnchor.constraint(equalTo: rightAnchor),
            productImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.525)
        ])
        
        addSubview(productNameLabel)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
            productNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            productNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
        
        addSubview(productPriceLabel)
        addSubview(productWeightLabel)
        productWeightLabel.translatesAutoresizingMaskIntoConstraints = false
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productWeightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            productWeightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            productPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            productPriceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
        ])
        
        layer.cornerRadius = 12
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
        
    }
}
