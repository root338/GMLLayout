//
//  GMLLayoutAttributesDefines.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 GML. All rights reserved.
//

import Foundation

public enum GMLLayoutAttribute {
    case left
    case right
    case top
    case bottom
    case width
    case heigth
    case centerX
    case centerY
}

public enum GMLLayoutRelation : Int {
    case lessThanOrEqual = -1
    case equal = 0
    case greaterThanOrEqual = 1
}
