//
//  MenuCollectionViewCell.swift
//  TestTaskGootax
//
//  Created by Илья Че on 21.01.2021.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = UIImageView()
    var label: UILabel = UILabel()
    
    static let reuseIdentifier = MenuCollectionViewCell.description()
    
    func confugure(menuImageName: String){
        let image = UIImage(named: menuImageName)
        imageView = UIImageView(image: image)
        label.text = "шаурма"
        
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
            [label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
             label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8)]
        )
        
        
    }
    
}


//MARK: -MenuCollectionViewCreate
//    func menuCollectionViewCreate(){
//        let layout = UICollectionViewFlowLayout()
//        menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        menuCollectionView.backgroundColor = view.backgroundColor
//
//
//        layout.minimumInteritemSpacing = gorizontalAndVerticalMenuSpacing
//        layout.minimumLineSpacing = gorizontalAndVerticalMenuSpacing
//
//        layout.sectionInset = UIEdgeInsets(top: topMenuViewSpacing, left: leftAndRightMenuViewSpacing, bottom: 0, right: leftAndRightMenuViewSpacing)
//
//        menuCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "menu")
//
//        view.addSubview(menuCollectionView)
//        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate(
//            [menuCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 262),
//             menuCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
//             menuCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
//             menuCollectionView.heightAnchor.constraint(equalToConstant: (view.frame.size.width * 0.717) + 10)
//            ]
//        )
//        menuCollectionView.delegate = self
//        menuCollectionView.dataSource = self
//    }

