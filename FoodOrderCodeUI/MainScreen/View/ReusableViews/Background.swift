//
//  Background.swift
//  FoodOrderCodeUI
//
//  Created by Илья Че on 27.01.2021.
//

import UIKit

class Background: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


