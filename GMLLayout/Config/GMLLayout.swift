//
//  GMLLayout.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

public protocol GMLLayout : NSObjectProtocol {
    func layout(config: (GMLLayoutMarker) -> Void)
    
    var left : GMLViewAttribute { get }
    var right : GMLViewAttribute { get }
    var top : GMLViewAttribute { get }
    var bottom : GMLViewAttribute { get }
    var width : GMLViewAttribute { get }
    var height : GMLViewAttribute { get }
    var centerX : GMLViewAttribute { get }
    var centerY : GMLViewAttribute { get }
}

private var _layoutMarkerKey : Void?
public extension GMLLayout {
    func layout(config: (GMLLayoutMarker) -> Void) {
        config(self._layoutMarker)
    }
    
    var left : GMLViewAttribute {
        return _viewAttribute(attribute: .left)
    }
    var right : GMLViewAttribute {
        return _viewAttribute(attribute: .right)
    }
    var top : GMLViewAttribute {
        return _viewAttribute(attribute: .top)
    }
    var bottom : GMLViewAttribute {
        return _viewAttribute(attribute: .bottom)
    }
    var width : GMLViewAttribute {
        return _viewAttribute(attribute: .width)
    }
    var height : GMLViewAttribute {
        return _viewAttribute(attribute: .heigth)
    }
    var centerX : GMLViewAttribute {
        return _viewAttribute(attribute: .centerX)
    }
    var centerY : GMLViewAttribute {
        return _viewAttribute(attribute: .centerY)
    }
    
    private var _layoutMarker : GMLLayoutMarker {
        
        var marker = objc_getAssociatedObject(self, &_layoutMarkerKey)
        if let resultValue = marker as? GMLLayoutMarker {
            return resultValue
        }
        marker = GMLLayoutMarker(linkLayout: self)
        objc_setAssociatedObject(self, &_layoutMarkerKey, marker, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return marker as! GMLLayoutMarker
    }
    
    private func _viewAttribute(attribute: GMLLayoutAttribute) -> GMLViewAttribute {
        return GMLViewAttribute(view: self, attribute: attribute)
    }
}
