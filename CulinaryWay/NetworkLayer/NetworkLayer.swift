//
//  NetworkLayer.swift
//  CulinaryWay
//
//  Created by MacBook Air on 16.12.2022.
//

import Foundation

protocol NetworkLayer {
    func getAllFruits(callback: @escaping FruitsCallback)
}
