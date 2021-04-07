//
//  DataManager.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 24.01.2021.
//

import Foundation


class DataManager{
    var products: Array<Product> = []
    var productGroupsNameAndImageURL: Dictionary<String, String> = [:]
    var groupBadgeNameAndImageURL: Dictionary< String, String> = [:]
    var newsData = [News(imageName: "newPoint", dateNews: "20 ноября", textNews: "Мы открыли новую точку доставки!"),
                    News(imageName: "likePizza", dateNews: "18 ноября", textNews: "Вкусная итальянская пицца доступна для заказа!"),
                    News(imageName: "susiNews", dateNews: "2 ноября", textNews: "Еще одно достижение наших поваров!")]
    
    
    let menu: Array<ProductGroup> = [ProductGroup(imageURLString: "shashlikMenu", productGroupName: "Шашлык"),
                                     ProductGroup(imageURLString: "hachapuriAndLomagioMenu", productGroupName: "Хачапури, Ломаджо"),
                                     ProductGroup(imageURLString: "shaurmaMenu", productGroupName: "Шаурма"),
                                     ProductGroup(imageURLString: "fishMenu", productGroupName: "Рыба"),
                                     ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"),
                                     ProductGroup(imageURLString: "lula-kebabMenu", productGroupName: "Люля-кебаб")]
    
    let veganBadge = Badge(imageURLString: "veganBadge", badgeName: "Вегетариантские")
    let hitBadge = Badge(imageURLString: "hitBadge", badgeName: "Хиты продаж")
    let newBadge = Badge(imageURLString: "newBadge", badgeName: "Новинки")
    
    private func getData(){
        products.append(Product(imageName: "shaurma", productName: "Шурма с крурицей", productGroup: ProductGroup(imageURLString: "shaurmaMenu", productGroupName: "Шаурма"), price: 180, weight: 150, badge: newBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Хачапури по аджарски", productGroup: ProductGroup(imageURLString: "hachapuriAndLomagioMenu", productGroupName: "Хачапури, Ломаджо"), price: 180, weight: 150, badge: nil, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Шашлык из баранины", productGroup: ProductGroup(imageURLString: "shashlikMenu", productGroupName: "Шашлык"), price: 180, weight: 150, badge: nil, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Люля-кебаб большой", productGroup: ProductGroup(imageURLString: "lula-kebabMenu", productGroupName: "Люля-кебаб"), price: 180, weight: 150, badge: nil, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Рыба на углях", productGroup: ProductGroup(imageURLString: "fishMenu", productGroupName: "Рыба"), price: 180, weight: 150, badge: hitBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Салат 'Цезарь'", productGroup: ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"), price: 180, weight: 150, badge: nil, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "burger", productName: "Большой чизбургер", productGroup: ProductGroup(imageURLString: "shaurmaMenu", productGroupName: "Бургеры"), price: 180, weight: 150, badge: nil, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "shaurma", productName: "Шурма с говядиной", productGroup: ProductGroup(imageURLString: "shaurmaMenu", productGroupName: "Шаурма"), price: 180, weight: 150, badge: hitBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "gurmanSoSwininoi", productName: "«Мясной гурман» со свининой", productGroup: ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"), price: 180, weight: 150, badge: hitBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "charcoalTomatoes", productName: "Помидоры на углях", productGroup: ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"), price: 180, weight: 150, badge: hitBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "slatIzOgurtsovIPomidorov", productName: "Салат из огурцов и помидоров", productGroup: ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"), price: 180, weight: 150, badge: newBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
        products.append(Product(imageName: "tepliiSalatSBaklaganami", productName: "Теплый салат с баклажанами", productGroup: ProductGroup(imageURLString: "zakuskiMenu", productGroupName: "Закуски"), price: 180, weight: 150, badge: newBadge, sizeVariable: nil, indigents: ["лаваш","курица","сыр","огурцы"]))
    }
    
    func config(){
        getData()
        getGroupBadgeNameAndImageURL()
        getProductGroup()
    }
    
    private func getProductGroup(){
        products.forEach { (product) in
            guard !productGroupsNameAndImageURL.keys.contains(product.productGroup.productGroupName)  else {return}
            productGroupsNameAndImageURL[product.productGroup.productGroupName] = product.productGroup.imageURLString
        }
    }
    
    private func getGroupBadgeNameAndImageURL(){
        products.forEach { (product) in
            guard let badgeName = product.badge?.badgeName else {return}
            guard !groupBadgeNameAndImageURL.keys.contains(badgeName)  else {return}
            groupBadgeNameAndImageURL[badgeName] = product.badge!.imageURLString
        }
    }
    
    func getProducts(forBadgeName badge: String?, forGroupName group: String? ) -> Array<Product>{
        var result = products
        if let badgeName = badge {
            result = result.filter { $0.badge?.badgeName == badgeName}
        }
        if let groupName = group {
            result = result.filter{ $0.productGroup.productGroupName == groupName
            }
        }
        return result
    }
}
