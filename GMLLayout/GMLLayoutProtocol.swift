//
//  GMLLayoutProtocol.swift
//  GMLLayoutDemo
//
//  Created by apple on 2020/4/13.
//  Copyright © 2020 GML. All rights reserved.
//

import UIKit

protocol GMLLayout : NSObjectProtocol {
    func config(layout: (GMLLayoutMarker) -> Void)
}


private var _layoutMarkerKey : Void?
extension GMLLayout {
    
    func config(layout: (GMLLayoutMarker) -> Void) {
        layout(self._layoutMarker)
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
}
