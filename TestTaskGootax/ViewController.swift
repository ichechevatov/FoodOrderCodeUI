//
//  ViewController.swift
//  TestTaskGootax
//
//  Created by Илья Че on 06.12.2020.
//

import UIKit


let countMenuItem = 6
let leftAndRightMenuViewSpacing: CGFloat = 15
let gorizontalAndVerticalMenuSpacing: CGFloat = 9
let topMenuViewSpacing: CGFloat = 10

class ViewController: UIViewController {
    
    enum SectionMainCollection: Int, CaseIterable{
        case SettingAndAdressSection
        case PromotionSection
        case MenuSection
        
        
         func createSection() -> NSCollectionLayoutSection {
            switch self {
            case .SettingAndAdressSection:
                return createSettingAndAdressSection()
            case .PromotionSection:
                return createPromotionSection()
            case .MenuSection:
                return createMenuSection()
            
            }
        }
        
       private func createSettingAndAdressSection() -> NSCollectionLayoutSection{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
        }
        
        private func createPromotionSection() -> NSCollectionLayoutSection{
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
            
            return section
        }
        
        private func createMenuSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4.5, bottom: 0, trailing: 4.5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/3*1.107))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 11.5, bottom: 0, trailing: 11.5)
            section.interGroupSpacing = 9
            
            let supplementaryItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
            let supplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: supplementaryItemSize, elementKind: MainCollectionReusableView.supplementaryViewOfKind, alignment: .top)
            supplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4.5, bottom: 0, trailing: 0)
            
            section.boundarySupplementaryItems = [supplementaryItem]
            return section
        }
    }
   
    
    var promotionsScrollView: UIScrollView!
    
    var mainScreenCollectionView: UICollectionView!
    
    var menuLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createCollectionView()
       
    }
    
    
    func createCollectionView(){
        mainScreenCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionViewLayout())
        
        mainScreenCollectionView.backgroundColor = .white
        view.addSubview(mainScreenCollectionView)
        mainScreenCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainScreenCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            mainScreenCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainScreenCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainScreenCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
       
        for section in SectionMainCollection.allCases{
            switch section {
            case .MenuSection:
                print("a")
            case .PromotionSection:
                print("a")
            case .SettingAndAdressSection:
                print("a")
            }
        }
            
    
            
        
        mainScreenCollectionView.dataSource = self
        //swich ???
        mainScreenCollectionView.register(SettingAndAdressCollectionViewCell.self, forCellWithReuseIdentifier: SettingAndAdressCollectionViewCell.reuseIdentifier)
        mainScreenCollectionView.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier)
        mainScreenCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.description())
        mainScreenCollectionView.register(MainCollectionReusableView.self, forSupplementaryViewOfKind: MainCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: MainCollectionReusableView.reuseIdentifier)
        
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sec, _ ) -> NSCollectionLayoutSection? in
            let section = SectionMainCollection.init(rawValue: sec)
            return section?.createSection()
        }
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 15
        layout.configuration = configuration
        return layout
    }
    
    
 
    
}

//MARK: -UICollectionViewDelegate
//extension ViewController: UICollectionViewDelegate{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(menuCollectionView.frame)
//        print(collectionView.cellForItem(at: indexPath)?.frame)
//        let a = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
//        print(a.imageView.frame)
//    }
//
//
//}

//MARK: -UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let sectionEnum = SectionMainCollection(rawValue: section) else {return 0}
        
        switch sectionEnum {
        case .SettingAndAdressSection:
            return 1
        case .PromotionSection:
            return StaticData.promotionImage.count
        case .MenuSection:
            return StaticData.menuImageNAme.count
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
            cell.confugure(menuImageName: StaticData.menuImageNAme[indexPath.item])
            return cell
            
        
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(kind)
        let reusableSupplementary = collectionView.dequeueReusableSupplementaryView(ofKind: MainCollectionReusableView.supplementaryViewOfKind, withReuseIdentifier: MainCollectionReusableView.reuseIdentifier, for: indexPath) as! MainCollectionReusableView
        reusableSupplementary.label.text = "Меню"
        return reusableSupplementary
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return SectionMainCollection.allCases.count
    }
    
    
}

//MARK: -UICollectionViewDelegateFlowLayout
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: (
//                        (menuCollectionView.frame.size.width - (leftAndRightMenuViewSpacing * 2) - (gorizontalAndVerticalMenuSpacing * 2)) / 3),
//                        height: (menuCollectionView.frame.size.height - topMenuViewSpacing - gorizontalAndVerticalMenuSpacing) / 2)
//    }
//
//}
