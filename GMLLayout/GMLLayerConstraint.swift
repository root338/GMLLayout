//
//  GMLLayerConstraint.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/14.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

class GMLLayerConstraint : NSObject, GMLConstraint {
    
    let fromItem : GMLLayerAttribute
    private(set) var toItem : GMLLayerAttribute?
    unowned var delegate : GMLConstraintDelegate
    
    var relation = GMLLayoutRelation.equal
    var multiplier = CGFloat(0)
    var constant = CGFloat(0)
    var active = true
    
    init(delegate: GMLConstraintDelegate, fromItem: GMLLayerAttribute) {
        self.delegate = delegate
        self.fromItem = fromItem
        super.init()
    }
}

extension GMLLayerConstraint {

    //MARK:- GMLConstraint
    func insets(_ insets: UIEdgeInsets) -> GMLConstraint {
        switch self.fromItem.attribute {
        case .left:
            constant = insets.left
        case .right:
            constant = insets.right
        case .top:
            constant = insets.top
        case .bottom:
            constant = insets.bottom
        default:
            break
        }
        return self
    }
    
    func size(_ size: CGSize) -> GMLConstraint {
        switch self.fromItem.attribute {
        case .width:
            constant = size.width
        case .heigth:
            constant = size.height
        default:
            break
        }
        return self
    }
    
    func offset(_ offset: CGFloat) -> GMLConstraint {
        constant = offset
        return self
    }
    
}
