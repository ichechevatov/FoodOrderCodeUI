//
//  ViewController.swift
//  TestTaskGootax
//
//  Created by Илья Че on 06.12.2020.
//

import UIKit

let adress = "Ижевск, Дерябина, 3"
let countMenuItem = 6
let leftAndRightMenuViewSpacing: CGFloat = 15
let gorizontalAndVerticalMenuSpacing: CGFloat = 9
let topMenuViewSpacing: CGFloat = 10

class ViewController: UIViewController {
    var settingButton: UIButton!
    var adressView: UIStackView!
    var adressLabel: UILabel!
    var adressViewButton: UIButton!
    var promotionsScrollView: UIScrollView!
    var menuCollectionView: UICollectionView!
    var menuLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        creatSettingButton()
        adressViewCreate()
        promotionsScrollViewCreate()
        menuCollectionViewCreate()
        menuLabelCreate()
        // Do any additional setup after loading the view.
    }
    //MARK: -SettingButton create
    func creatSettingButton(){
        settingButton = UIButton()
        view.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.setImage(UIImage(named: "settingButton"), for: .normal)
        
        NSLayoutConstraint.activate([
            settingButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            settingButton.heightAnchor.constraint(equalToConstant: 25),
            settingButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        settingButton.contentVerticalAlignment = .center
        settingButton.contentHorizontalAlignment = .center
        
    }
    
    //MARK: -AdressView create
    
    func adressViewCreate(){
        adressView = UIStackView()
        adressLabel = UILabel()
        adressViewButton = UIButton()
        
        
        view.addSubview(adressView)
        adressView.addArrangedSubview(adressLabel)
        adressView.addArrangedSubview(adressViewButton)
        
        
        adressView.translatesAutoresizingMaskIntoConstraints = false
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        adressViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adressView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 65),
            adressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 57)
        ])
        
        
        adressViewButton.setImage(UIImage(named: "adressViewButton"), for: .normal)
        
        adressLabel.text = adress
        adressLabel.font = UIFont(name: "SF Pro Display", size: 16) //попробовать
        
        adressView.spacing = 10
        adressView.alignment = .bottom
        adressView.axis = .horizontal
        
    }
    
    //MARK: -promotionsScrollView
    
    func promotionsScrollViewCreate(){
        let promoImages = [UIImage(named: "promotionsBaner") , UIImage(named: "promotionsBaner") , UIImage(named: "promotionsBaner")]
        var promoImagesViews : [UIImageView] = []
        
        for image in promoImages{
            
            let imageView = UIImageView(image: image)
            
            imageView.layer.cornerRadius = 12
            imageView.clipsToBounds = true
           
            promoImagesViews.append(imageView)
        }
        
        let stackView = UIStackView(arrangedSubviews: promoImagesViews)
        promotionsScrollView = UIScrollView()
        
        promotionsScrollView.addSubview(stackView)
        view.addSubview(promotionsScrollView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        promotionsScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [promotionsScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 97),
             promotionsScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
             promotionsScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
             promotionsScrollView.heightAnchor.constraint(equalToConstant: 115)]
        )
        
        stackView.spacing = 10
        stackView.axis = .horizontal
        NSLayoutConstraint.activate(
            [stackView.topAnchor.constraint(equalTo: promotionsScrollView.topAnchor),
             stackView.leftAnchor.constraint(equalTo: promotionsScrollView.leftAnchor),
             stackView.rightAnchor.constraint(equalTo: promotionsScrollView.rightAnchor),
             stackView.bottomAnchor.constraint(equalTo: promotionsScrollView.bottomAnchor),
             stackView.heightAnchor.constraint(equalTo: promotionsScrollView.heightAnchor)]
        )
    }
    
    func menuCollectionViewCreate(){
        let layout = UICollectionViewFlowLayout()
        menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        menuCollectionView.backgroundColor = view.backgroundColor
        
        
        layout.minimumInteritemSpacing = gorizontalAndVerticalMenuSpacing
        layout.minimumLineSpacing = gorizontalAndVerticalMenuSpacing

        layout.sectionInset = UIEdgeInsets(top: topMenuViewSpacing, left: leftAndRightMenuViewSpacing, bottom: 0, right: leftAndRightMenuViewSpacing)
        
        menuCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "menu")
        
        view.addSubview(menuCollectionView)
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [menuCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 262),
             menuCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
             menuCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
             menuCollectionView.heightAnchor.constraint(equalToConstant: (view.frame.size.width * 0.717) + 10)
            ]
        )
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    func menuLabelCreate(){
        menuLabel = UILabel()
        view.addSubview(menuLabel)
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuLabel.text = "Меню"
        menuLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        NSLayoutConstraint.activate([
                                        menuLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 227),
                                        menuLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17)])
    }
}


extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(menuCollectionView.frame)
        print(collectionView.cellForItem(at: indexPath)?.frame)
        let a = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        print(a.imageView.frame)
    }
    
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countMenuItem
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! CollectionViewCell
        
        cell.confugure()
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (
                        (menuCollectionView.frame.size.width
                            - (leftAndRightMenuViewSpacing * 2)
                         - (gorizontalAndVerticalMenuSpacing * 2)
                        ) / 3), height: (menuCollectionView.frame.size.height - topMenuViewSpacing - gorizontalAndVerticalMenuSpacing) / 2)
        
        
    }
    
}
