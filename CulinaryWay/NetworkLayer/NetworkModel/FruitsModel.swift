//
//  FruitsModel.swift
//  CulinaryWay
//
//  Created by MacBook Air on 16.12.2022.
//

import Foundation

struct FruitData: Codable {
    let genus, name: String?
    let id: Int?
    let family, order: String?
    let nutritions: Nutritions?
}

struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double?
    let calories: Int?
    let sugar: Double?
}


let fruitPictures: [String] = [ "Apple", "Apricot", "Avocado", "Banana", "Blackberry", "Blueberry", "Cherry", "Cranberry", "DragonFruit", "Durian", "Feijoa", "Ficus", "Gooseberry", "Grapes", "GreenApple", "Guava", "Kiwi", "Kiwifruit", "Lemon", "Lime", "Lingonberry", "Lychee", "Mango", "Melon", "Morus", "Orange", "Papaya", "Passionfruit", "Peach", "Pear", "Persimmon", "Pineapple","Pitaya",  "Plum", "Pomegranate", "Raspberry", "Strawberry", "Tangerine", "Tomato", "Watermelon"]
