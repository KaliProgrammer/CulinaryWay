//
//  MyFavoriteViewModel.swift
//  CulinaryWay
//
//  Created by MacBook Air on 20.02.2023.
//

import Foundation
import UIKit
import Combine

class MyFavoriteViewModel {
    
    let labelText = PassthroughSubject<String, Never>()
    
    func setText() {
        labelText.send("Нет рецептов")
    }

}
