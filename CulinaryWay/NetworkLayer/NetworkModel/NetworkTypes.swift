//
//  NetworkTYpes.swift
//  CulinaryWay
//
//  Created by MacBook Air on 16.12.2022.
//

import Foundation

typealias FruitsResult = Result<Array<FruitData>, NetworkError>
typealias FruitsCallback = (FruitsResult) -> Void


