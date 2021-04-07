//
//  MenuCollectionView.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 01.03.2021.
//
private enum SectionMenuCollection: Int, CaseIterable {
    case AdressAndSettingSection
    case ProductGroupSelectorSection
    case ProductCardsSection
}

import UIKit

class MenuCollectionView: UICollectionView {

    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        dataSource = self
        delegate = self
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


//MARK:-DataSouce
extension MenuCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}


//MARK:-Delegat
extension MenuCollectionView: UICollectionViewDelegate {
    
}
