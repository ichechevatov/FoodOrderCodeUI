//
//  NewsCollectionViewCell.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 01.02.2021.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let dateLabel = UILabel()
    let newsLabel = UILabel()
    let line = UIView()
    
    static let reuseIdentifier = NewsCollectionViewCell.description()
    
    func configure(imageName: String, date: String, newsText: String) {
        addSubview(imageView)
        addSubview(dateLabel)
        addSubview(newsLabel)
        addSubview(line)
        
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        dateLabel.text = date
        dateLabel.textColor = UIColor(red: 113/255, green: 113/255, blue: 113/255, alpha: 1)
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        
        newsLabel.text = newsText
        newsLabel.font = UIFont.systemFont(ofSize: 16)
        newsLabel.numberOfLines = 3
        
        line.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
                                     imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                                     imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
                                     imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 105/80)])
        
        NSLayoutConstraint.activate([dateLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
                                     dateLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([newsLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 11),
                                     newsLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
                                     newsLabel.rightAnchor.constraint(equalTo: rightAnchor)])
        
        NSLayoutConstraint.activate([line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                                     line.leftAnchor.constraint(equalTo: leftAnchor),
                                     line.rightAnchor.constraint(equalTo: rightAnchor),
                                     line.heightAnchor.constraint(equalToConstant: 1)])
        
        
    }
}
