//
//  Functions.swift
//  Lab3
//
//  Created by Steven Wong on 25/1/2022.
//

import Foundation
import UIKit

class Functions{
    static func distance(a: CGPoint, b: CGPoint) -> CGFloat{
        return sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2))
    }
}
