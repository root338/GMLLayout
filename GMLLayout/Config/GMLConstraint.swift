//
//  GMLConstraint.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

protocol GMLConstraintDelegate : NSObjectProtocol {
    func constraint(_ constraint: GMLConstraintPrivate, shouldBeReplaced replacedConstraint: GMLConstraintPrivate)
    func constraint(_ constraint: GMLConstraintPrivate, addConstraint layoutAttribute: GMLLayoutAttribute) -> GMLConstraintPrivate
}

protocol GMLConstraintPrivate : GMLConstraint {
    var delegate : GMLConstraintDelegate { get set }
}

extension GMLConstraintPrivate {
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
