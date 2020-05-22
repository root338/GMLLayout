//
//  GMLLayoutMarker.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

public class GMLLayoutMarker: NSObject, GMLConstraintAttribute {
    
    weak private(set) var linkLayout : GMLLayout?
    lazy var constraints = [GMLConstraintPrivate]()
    
    init(linkLayout: GMLLayout) {
        self.linkLayout = linkLayout
        super.init()
    }
}

public extension GMLLayoutMarker {
    //MARK:- GMLConstraintAttribute
    var left : GMLConstraint {
        return constraint(attribute: .left)
    }
    var right : GMLConstraint {
        return constraint(attribute: .right)
    }
    var top : GMLConstraint {
        return constraint(attribute: .top)
    }
    var bottom : GMLConstraint {
        return constraint(attribute: .bottom)
    }
    var width : GMLConstraint {
        return constraint(attribute: .width)
    }
    var height : GMLConstraint {
        return constraint(attribute: .heigth)
    }
    var centerX : GMLConstraint {
        return constraint(attribute: .centerX)
    }
    var centerY : GMLConstraint {
        return constraint(attribute: .centerY)
    }
}

//MARK:- 设置布局
extension GMLLayoutMarker : GMLConstraintDelegate {
    //MARK:- GMLConstraintDelegate
    func constraint(_ constraint: GMLConstraintPrivate, shouldBeReplaced replacedConstraint: GMLConstraintPrivate) {
        _ = try? constraints.ml_replace(constraint, replaceObj: replacedConstraint)
    }
    
    func constraint(_ constraint: GMLConstraintPrivate, addConstraint layoutAttribute: GMLLayoutAttribute) -> GMLConstraintPrivate {
        
        let attributeConstraint = self.constraint(attribute: layoutAttribute)
        let newConstraint = GMLCompositeConstraint(delegate: self, constraints: [constraint, attributeConstraint])
        constraint.delegate = newConstraint
        newConstraint.delegate = self
        self.constraint(constraint, shouldBeReplaced: newConstraint)
        return newConstraint
    }
    
}

extension GMLLayoutMarker {
    func install() {
        
    }
    func uninstall() {
        
    }
}

private extension GMLLayoutMarker {
    
    func layerAttribute(attribute: GMLLayoutAttribute) -> GMLViewAttribute {
        return GMLViewAttribute(view: linkLayout, attribute: attribute)
    }
    func constraint(attribute: GMLLayoutAttribute) -> GMLConstraint {
        return constraint(attribute: layerAttribute(attribute: attribute))
    }
    func constraint(attribute: GMLViewAttribute) -> GMLConstraint {
        let constraint = GMLViewConstraint(delegate: self, fromItem: attribute)
        constraints.append(constraint)
        return constraint
    }
}
