//
//  URLSession.swift
//  CulinaryWay
//
//  Created by MacBook Air on 16.12.2022.
//

import Foundation

class URLSessionLayer: NetworkLayer {

    private let fruitAddress = "https://www.fruityvice.com/api/fruit/all"

    init() {}

    func getAllFruits(callback: @escaping FruitsCallback) {
        let url = URL(string: fruitAddress)
        let urlRequest = URLRequest(url: url!)

        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                callback(Result.failure(.custom(error?.localizedDescription ?? "")))
                return
            }
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            do {
                let fruits = try JSONDecoder().decode([FruitData].self, from: data!)
                callback(Result.success(fruits))
                print(fruits)
            } catch {
                callback(Result.failure(.wrongJson("Wrong format")))
            }
        }.resume()
    }
}
