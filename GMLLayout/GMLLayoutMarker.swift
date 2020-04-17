//
//  GMLLayoutMarker.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

class GMLLayoutMarker: NSObject {
    
    weak private(set) var linkLayout : GMLLayout?
    lazy private var constraints = [GMLConstraint]()
    
    init(linkLayout: GMLLayout) {
        self.linkLayout = linkLayout
        super.init()
    }
    
    
}

//MARK:- 设置布局
extension GMLLayoutMarker : GMLConstraintDelegate {
    //MARK:- GMLConstraintDelegate
    func constraint(_ constraint: GMLConstraint, shouldBeReplaced replacedConstraint: GMLConstraint) {
        _ = try? constraints.ml_replace(constraint, replaceObj: replacedConstraint)
    }
    
    func constraint(_ constraint: GMLConstraint, addConstraint layoutAttribute: GMLLayoutAttribute) -> GMLConstraint {
        
    }
    
    
}

extension GMLLayoutMarker {
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

private extension GMLLayoutMarker {
    
    func layerAttribute(attribute: GMLLayoutAttribute) -> GMLLayerAttribute {
        return GMLLayerAttribute(layer: linkLayout, attribute: attribute)
    }
    func constraint(attribute: GMLLayerAttribute) -> GMLConstraint {
        return GMLLayerConstraint.init(delegate: self, fromItem: attribute)
    }
    func constraint(attribute: GMLLayoutAttribute) -> GMLConstraint {
        return constraint(attribute: layerAttribute(attribute: attribute))
    }
}
