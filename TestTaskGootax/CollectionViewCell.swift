//
//  CollectionViewCell.swift
//  TestTaskGootax
//
//  Created by Илья Че on 15.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var image: UIImage!
    var imageView: UIImageView!
    var label: UILabel!
    

    
    func confugure(){
        image = UIImage()
        imageView = UIImageView(image: image)
        imageView.backgroundColor = .blue
        self.backgroundColor = .green
        label = UILabel()
        label.text = "шаурма"
        
        self.addSubview(imageView)
        self.addSubview(label)
        
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
            //UIColor(red: 229, green: 229, blue: 229, alpha: 1).cgColor
        //self.layer.borderColor = UIColor.gray.cgColor
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
            [label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
             label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)]
        )
        
        
    }
    
}
