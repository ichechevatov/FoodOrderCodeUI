//
//  Product.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 22.01.2021.
//

import Foundation


struct Product {
    let imageName: String //заменить imageName на Url
    let productName: String
    let productGroup: ProductGroup // заменить на структуру ProductGroup
    
    let price: Int
    let weight: Int
    let badge: Badge? // бэидж
    
    let sizeVariable: Dictionary<String, Int>?
    
    let indigents:Array<String>
}
