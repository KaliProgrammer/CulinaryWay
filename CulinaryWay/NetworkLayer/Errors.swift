//
//  Errors.swift
//  CulinaryWay
//
//  Created by MacBook Air on 16.12.2022.
//

import Foundation

public enum NetworkError: Error {
    case custom(String)
    case emptyData
    case wrongJson(String)
}
