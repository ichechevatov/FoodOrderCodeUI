//
//  MainCollectionView.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 23.01.2021.
//

//MARK: - ENUM Sections
private enum SectionMainCollection: Int, CaseIterable{
    case SettingAndAdressSection
    case PromotionSection
    case MenuSection
    case HitSalesSection
    case NewProductSection
    case NewsSection
    
    func createSection() -> NSCollectionLayoutSection {
        switch self {
        case .SettingAndAdressSection:
            return SettingAndAdressSectionLayout().section
        case .PromotionSection:
            return PromotionSectionLayout().section
        case .MenuSection:
            return MenuSectionLayout().section
        case .HitSalesSection:
            return HitSalesAndNewProductSectionLayout().section
        case .NewProductSection:
            return HitSalesAndNewProductSectionLayout().section
        case .NewsSection:
            return NewsSectionLayout().section
        }
    }
    
    func textForSupplementaryView() -> String{//????
        switch self{
        case .SettingAndAdressSection:
            return ""
        case .PromotionSection:
            return ""
        case .MenuSection:
            return "Меню"
        case .HitSalesSection:
            return "Хиты продаж"
        case .NewProductSection:
            return "Новинки"
        case .NewsSection:
            return "Новости"
        }
    }
}


import UIKit

class MainCollectionView: UICollectionView {
    
    var dataController: MainCollectionViewDataController?
    var delegat: MainCollectionViewDelegat? // router??
    
    //MARK: - Init
    init(){
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        backgroundColor = .white
        registerReusableCell()
        print("reg")
        collectionViewLayout = createCollectionViewLayout()
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - registerReusableCell
    private func registerReusableCell(){
        for section in SectionMainCollection.allCases{
            switch section {
            case .MenuSection:
                register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.description())
            case .PromotionSection:
                register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier)
            case .SettingAndAdressSection:
                register(SettingAndAdressCollectionViewCell.self, forCellWithReuseIdentifier: SettingAndAdressCollectionViewCell.reuseIdentifier)
            case .HitSalesSection:
                register(ProductCardCollectionViewCell.self, forCellWithReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier)
            case .NewProductSection:
                register(ProductCardCollectionViewCell.self, forCellWithReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier)
            case .NewsSection:
                register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.reuseIdentifier)
            }
        }
        register(MainCollectionReusableView.self, forSupplementaryViewOfKind: MainCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: MainCollectionReusableView.reuseIdentifier)
        register(BadgeCollectionReusableView.self, forSupplementaryViewOfKind: BadgeCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: BadgeCollectionReusableView.reuseIdentifier)
    }
    //MARK: - createCollectionViewLayout
    private func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sec, _ ) -> NSCollectionLayoutSection? in
            let section = SectionMainCollection.init(rawValue: sec)
            
            return section?.createSection()
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        layout.configuration = configuration
        //layout.register(Background.self, forDecorationViewOfKind: "Element")
        return layout
    }
}
//MARK: - UICollectionViewDelegate
extension MainCollectionView: UICollectionViewDelegate{
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        delegat?.goToVc(cell: collectionView.cellForItem(at: indexPath)!)
    //    }
}

//MARK: - UICollectionViewDataSource
extension MainCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sectionEnum = SectionMainCollection(rawValue: section) else {return 0}
        
        switch sectionEnum {
        case .SettingAndAdressSection:
            return 1
        case .PromotionSection:
            return StaticData.promotionImage.count//
        case .MenuSection:
            return dataController?.getDataForMenuSection().count ?? 0
        case .HitSalesSection:
            return dataController?.getDataForProductCard(forBadgeName: sectionEnum.textForSupplementaryView(), forGroupName: nil).count ?? 0
        case .NewProductSection:
            return  dataController?.getDataForProductCard(forBadgeName: sectionEnum.textForSupplementaryView(), forGroupName: nil).count ?? 0
        case .NewsSection:
            return  3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionEnum = SectionMainCollection(rawValue: indexPath.section) else {return UICollectionViewCell()}
        
        switch sectionEnum {
        case .SettingAndAdressSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingAndAdressCollectionViewCell.reuseIdentifier, for: indexPath) as! SettingAndAdressCollectionViewCell
            cell.configure()
            return cell
            
        case .PromotionSection:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier, for: indexPath) as! PromotionCollectionViewCell
            cell.configure(banerName: StaticData.promotionImage[indexPath.item])
            return cell
            
        case .MenuSection:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
            guard let data = dataController?.getDataForMenuSection()[indexPath.item] else {return cell}
            cell.confugure(imageName: data.imageName, productGroupName: data.productName)
            
            return cell
            
        case .HitSalesSection:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCardCollectionViewCell
            guard let dataCell = dataController?.getDataForProductCard(forBadgeName: sectionEnum.textForSupplementaryView(), forGroupName: nil)[indexPath.item] else {return cell}
            
            cell.configure(imageName: dataCell.imageName, productName: dataCell.productName, productPrice: dataCell.productPrice, productWeght: dataCell.productWeght, badge: dataCell.badge)
            
            return cell
            
        case .NewProductSection:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCardCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCardCollectionViewCell
            guard let dataCell = dataController?.getDataForProductCard(forBadgeName: sectionEnum.textForSupplementaryView(), forGroupName: nil)[indexPath.item] else {return cell}
            
            cell.configure(imageName: dataCell.imageName, productName: dataCell.productName, productPrice: dataCell.productPrice, productWeght: dataCell.productWeght, badge: dataCell.badge)
            return cell
            
        case .NewsSection:
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.reuseIdentifier, for: indexPath) as! NewsCollectionViewCell
            guard let dataCell = dataController?.getDataForNewsSection()[indexPath.item] else {return cell}
            cell.configure(imageName: dataCell.imageName, date: dataCell.date, newsText: dataCell.newsText)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionEnum = SectionMainCollection.init(rawValue: indexPath.section)
        switch kind {
        case MainCollectionReusableView.supplementaryViewOfKind:
            let reusableSupplementary = collectionView.dequeueReusableSupplementaryView(ofKind: MainCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: MainCollectionReusableView.reuseIdentifier, for: indexPath) as! MainCollectionReusableView
            reusableSupplementary.label.text = sectionEnum?.textForSupplementaryView()
            return reusableSupplementary
            
        case BadgeCollectionReusableView.supplementaryViewOfKind:
            let reusableSupplementary = collectionView.dequeueReusableSupplementaryView(ofKind: BadgeCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: BadgeCollectionReusableView.reuseIdentifier, for: indexPath) as! BadgeCollectionReusableView
            if let badgeImage = dataController?.getImageNameForBadgeName(badgeName: sectionEnum!.textForSupplementaryView()){
                
                reusableSupplementary.config(badgeImage: badgeImage)
            }
            return reusableSupplementary
        default:
            return UICollectionReusableView()
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionMainCollection.allCases.count
    }
}
