//
//  MainCollectionViewDataController.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 28.01.2021.
//

import Foundation

protocol MainCollectionViewDataController {
    func getDataForMenuSection() -> Array<(imageName: String, productName: String)>
    
    func getDataForProductCard(forBadgeName badge: String?, forGroupName group: String?) -> Array<(imageName: String, productName: String, productPrice: String, productWeght: String, badge: String?)>
    
    func getImageNameForBadgeName(badgeName: String) -> String
    
    func getDataForNewsSection() ->Array<(imageName: String, date: String, newsText: String)>
    
    
    
}
