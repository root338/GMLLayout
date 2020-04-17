//
//  GMLCompositeConstraint.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit
import GMLFoundationExtension

class GMLCompositeConstraint: NSObject, GMLConstraint {
    unowned var delegate: GMLConstraintDelegate
    
    private var constraints : [GMLConstraint]
    init(delegate: GMLConstraintDelegate, constraints: [GMLConstraint]) {
        self.delegate = delegate
        self.constraints = constraints
        super.init()
    }
}

extension GMLCompositeConstraint : GMLConstraintDelegate {
    
    //MARK:- GMLConstraintDelegate
    func constraint(_ constraint: GMLConstraint, shouldBeReplaced replacedConstraint: GMLConstraint) {
        
        _ = try? constraints.ml_replace(constraint, replaceObj: replacedConstraint)
    }
    
    func constraint(_ constraint: GMLConstraint, addConstraint layoutAttribute: GMLLayoutAttribute) -> GMLConstraint {
        let newConstraint = delegate.constraint(self, addConstraint: layoutAttribute)
        newConstraint.delegate = self
        constraints.append(newConstraint)
        return self
    }
    
    //MARK:- GMLConstraint
    func insets(_ insets: UIEdgeInsets) -> GMLConstraint {
        for constraint in constraints {
            _ = constraint.insets(insets)
        }
        return self
    }
    
    func size(_ size: CGSize) -> GMLConstraint {
        for constraint in constraints {
            _ = constraint.size(size)
        }
        return self
    }
    
    func offset(_ offset: CGFloat) -> GMLConstraint {
        for constraint in constraints {
            _ = constraint.offset(offset)
        }
        return self
    }
}

private extension GMLCompositeConstraint {
    
}
