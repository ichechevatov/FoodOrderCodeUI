//
//  NewsSectionLayout.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 27.01.2021.
//

import UIKit

struct NewsSectionLayout {
    let  section: NSCollectionLayoutSection = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.32))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 15)
        
        let sectionNameItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let sectionName = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionNameItemSize, elementKind: MainCollectionReusableView.supplementaryViewOfKind, alignment: .top)
        //        let separatorLineItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
        //        let separatorLine = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: separatorLineItemSize, elementKind: <#T##String#>, alignment: <#T##NSRectAlignment#>)
        
        
        section.boundarySupplementaryItems = [sectionName]
        
        return section
    }()
}
