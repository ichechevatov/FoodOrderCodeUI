//
//  ViewController.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 06.12.2020.
//

import UIKit


class ViewController: UIViewController {
    var transitionDelegat: ContrDelegat!
    
    var selectedCell: UICollectionViewCell!
    
    let data = DataManager()
    let mainCollectionView = MainCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view = mainCollectionView
        data.config()
        mainCollectionView.dataController = self
       // mainCollectionView.delegat = self
    }
}


extension ViewController: MainCollectionViewDataController {
    func getDataForNewsSection() -> Array<(imageName: String, date: String, newsText: String)> {
       return data.newsData.map {($0.imageName, $0.dateNews, $0.textNews)}
    }
    
    func getDataForMenuSection() -> Array<(imageName: String, productName: String)> {
        return data.menu.map({ ($0.imageURLString, $0.productGroupName)})
    }
    
    func getDataForProductCard(forBadgeName badge: String?, forGroupName group: String?) -> Array<(imageName: String, productName: String, productPrice: String, productWeght: String, badge: String?)> {
        let productForBadge = data.getProducts(forBadgeName: badge, forGroupName: group)
        return productForBadge.map { (imageName: $0.imageName, productName: $0.productName, productPrice: String($0.price), productWeght: String($0.weight),  $0.badge?.badgeName)
        }
    }
    
    func getImageNameForBadgeName(badgeName: String) -> String {
         let result = data.groupBadgeNameAndImageURL[badgeName]
        return result ?? "если такой картинки не будет, то ничего не покажется"
    }
}


//extension ViewController: MainCollectionViewDelegat {
//    func goToVc(cell: UICollectionViewCell) {
//        let vc = MenuViewController()
//        transitionDelegat = ContrDelegat(cell: cell)
//        vc.transitioningDelegate = transitionDelegat
//        vc.modalPresentationStyle = .custom
//        //vc.isModalInPresentation = true
//        self.present(vc, animated: true, completion: nil)
//        //self.show(vc, sender: self)
//    }
//
//}



