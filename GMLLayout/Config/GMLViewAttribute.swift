//
//  GMLViewAttribute.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 GML. All rights reserved.
//

import Foundation
/// 单个视窗的布局属性信息
public struct GMLViewAttribute {
    /// 指定视窗
    weak private(set) var view : GMLLayout?
    /// 对应的布局属性
    let attribute : GMLLayoutAttribute
    
}
