//
//  GMLConstraint+Public.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/20.
//  Copyright © 2020 GML. All rights reserved.
//

/**
 GMLConstraint 的开放接口
 */

import UIKit

/// GMLConstraint 四周边距设置协议
public protocol GMLConstraintAttribute : NSObjectProtocol {
    var left : GMLConstraint { get }
    var right : GMLConstraint { get }
    var top : GMLConstraint { get }
    var bottom : GMLConstraint { get }
    var width : GMLConstraint { get }
    var height : GMLConstraint { get }
    var centerX : GMLConstraint { get }
    var centerY : GMLConstraint { get }
}
/// GMLConstraint 内容设置协议
public protocol GMLConstraintValue : NSObjectProtocol {
    func insets(_ insets: UIEdgeInsets) -> GMLConstraint
    func inset(_ inset: CGFloat) -> GMLConstraint
    func size(_ size: CGSize) -> GMLConstraint
    func offset(_ offset: CGFloat) -> GMLConstraint
    func equal(_ viewAttribute: GMLViewAttribute) -> GMLConstraint
}

public protocol GMLConstraint : GMLConstraintAttribute, GMLConstraintValue {
    
}
