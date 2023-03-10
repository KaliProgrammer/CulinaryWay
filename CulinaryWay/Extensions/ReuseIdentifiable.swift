//
//  ReuseIdentifiable.swift
//  CulinaryWay
//
//  Created by MacBook Air on 09.03.2023.
//

import Foundation
import UIKit

protocol ReuseIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReuseIdentifiable {}
