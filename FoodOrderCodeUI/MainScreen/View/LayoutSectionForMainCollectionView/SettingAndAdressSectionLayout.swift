//
//  SettingAndAdressSection.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 24.01.2021.
//

import UIKit

struct SettingAndAdressSectionLayout {
    
    let section: NSCollectionLayoutSection = { 
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        return NSCollectionLayoutSection(group: group) }()
}
