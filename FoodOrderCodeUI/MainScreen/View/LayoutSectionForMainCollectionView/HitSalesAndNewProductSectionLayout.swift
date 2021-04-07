//
//  HitSalesAndNewProductSectionLayout.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 24.01.2021.
//

import UIKit

struct HitSalesAndNewProductSectionLayout {
    let section: NSCollectionLayoutSection = {
        let badgeItemSize = NSCollectionLayoutSize(widthDimension: .absolute(32), heightDimension: .absolute(32))
        let badgeItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: badgeItemSize, elementKind: BadgeCollectionReusableView.supplementaryViewOfKind, containerAnchor: .init(edges: [.top, .trailing], absoluteOffset: CGPoint(x: -10, y: 10)))
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [badgeItem])
        //let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2.5), heightDimension: .fractionalWidth(0.53))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 15)
        section.interGroupSpacing = 9
        
        let supplementaryItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementaryItemSize, elementKind: MainCollectionReusableView.supplementaryViewOfKind, alignment: .top)
        //supplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4.5, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = [supplementaryItem]
        
        //let sectionBackground = NSCollectionLayoutDecorationItem.background(elementKind: "Element")
        //section.decorationItems = [sectionBackground]
        
        return section
    }()
}
