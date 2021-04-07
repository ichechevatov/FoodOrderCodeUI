//
//  MenuCollectionViewCell.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 21.01.2021.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = UIImageView()
    var label: UILabel = UILabel()
    
    static let reuseIdentifier = MenuCollectionViewCell.description()
    
    func confugure(imageName: String, productGroupName: String){
        let image = UIImage(named: imageName)
        imageView = UIImageView(image: image)
        label.text = productGroupName
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14)
        
        
        self.addSubview(imageView)
        self.addSubview(label)
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [imageView.topAnchor.constraint(equalTo: self.topAnchor),
             imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
             imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
             imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.734)]
        )
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [//label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
                label.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
                label.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)]
        )
        
        
    }
    
}


