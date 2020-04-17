//
//  GMLConstraint.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

protocol GMLConstraintDelegate : NSObjectProtocol {
    func constraint(_ constraint: GMLConstraint, shouldBeReplaced replacedConstraint: GMLConstraint)
    func constraint(_ constraint: GMLConstraint, addConstraint layoutAttribute: GMLLayoutAttribute) -> GMLConstraint
}

protocol GMLConstraint : NSObjectProtocol {
    var delegate : GMLConstraintDelegate { get set }
    var left : GMLConstraint { get }
    var right : GMLConstraint { get }
    var top : GMLConstraint { get }
    var bottom : GMLConstraint { get }
    var width : GMLConstraint { get }
    var height : GMLConstraint { get }
    var centerX : GMLConstraint { get }
    var centerY : GMLConstraint { get }
    
//    init(delegate: GMLConstraintDelegate)
    
    func insets(_ insets: UIEdgeInsets) -> GMLConstraint
    func inset(_ inset: CGFloat) -> GMLConstraint
    func size(_ size: CGSize) -> GMLConstraint
    func offset(_ offset: CGFloat) -> GMLConstraint
}

//class GMLConstraint: NSObject {
//    unowned private var delegate : GMLConstraintDelegate
//
//    init(delegate: GMLConstraintDelegate) {
//        self.delegate = delegate
//        super.init()
//    }
//}

extension GMLConstraint {
    var left : GMLConstraint {
        return delegate.constraint(self, addConstraint: .left)
    }
    var right : GMLConstraint {
        return delegate.constraint(self, addConstraint: .right)
    }
    var top : GMLConstraint {
        return delegate.constraint(self, addConstraint: .top)
    }
    var bottom : GMLConstraint {
        return delegate.constraint(self, addConstraint: .bottom)
    }
    var width : GMLConstraint {
        return delegate.constraint(self, addConstraint: .width)
    }
    var height : GMLConstraint {
        return delegate.constraint(self, addConstraint: .heigth)
    }
    var centerX : GMLConstraint {
        return delegate.constraint(self, addConstraint: .centerX)
    }
    var centerY : GMLConstraint {
        return delegate.constraint(self, addConstraint: .centerY)
    }
    
    func inset(_ inset: CGFloat) -> GMLConstraint {
        _ = insets(UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
        return self
    }
}
