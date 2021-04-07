//
//  SettingAndAdressCollectionViewCell.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 17.01.2021.
//

import UIKit
let adress = "Ижевск, Ленина, 33"

class SettingAndAdressCollectionViewCell: UICollectionViewCell {
    
    var settingButton = UIButton()
    var adressView = UIStackView()
    var adressLabel = UILabel()
    var adressViewButton = UIButton()
    
    static let reuseIdentifier = SettingAndAdressCollectionViewCell.description()
    
    func configure(){
       
        configureSettingButton()
        configureAdressView()
    }
    
    func configureSettingButton(){
        addSubview(settingButton)
        
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.setImage(UIImage(named: "settingButton"), for: .normal)
        
        NSLayoutConstraint.activate([
            settingButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            settingButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            settingButton.heightAnchor.constraint(equalToConstant: 25),
            settingButton.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        settingButton.contentVerticalAlignment = .center
        settingButton.contentHorizontalAlignment = .center
    }
    
    func configureAdressView(){
        addSubview(adressView)
        
        adressView.addArrangedSubview(adressLabel)
        adressView.addArrangedSubview(adressViewButton)
        
        adressView.translatesAutoresizingMaskIntoConstraints = false
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        adressViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adressView.leftAnchor.constraint(equalTo: settingButton.rightAnchor, constant: 28),
            adressView.centerYAnchor.constraint(equalTo: settingButton.centerYAnchor)
        ])
        adressViewButton.setImage(UIImage(named: "adressViewButton"), for: .normal)
        
        adressLabel.text = adress
        adressLabel.font = UIFont(name: "SF Pro Display", size: 16) //попробовать
        
        adressView.spacing = 10
        adressView.alignment = .bottom
        adressView.axis = .horizontal
    }

    
}
