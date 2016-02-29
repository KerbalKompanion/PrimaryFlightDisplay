//
//  AttitudeReferenceIndex.swift
//  MavlinkPrimaryFlightDisplay
//
//  Created by Michael Koukoullis on 4/01/2016.
//  Copyright © 2016 Michael Koukoullis. All rights reserved.
//

import SpriteKit

class AttitudeReferenceIndex: SKNode {
    
    let style: AttitudeReferenceIndexStyleType
    
    init(style: AttitudeReferenceIndexStyleType) {
        self.style = style
        super.init()
        
        addChild(buildLeftBar(transform: CGAffineTransformMakeTranslation(CGFloat(-style.sideBarOffset), 0)))
        addChild(buildLeftBar(transform: CGAffineTransformMake(-1, 0, 0, 1, CGFloat(style.sideBarOffset), 0)))
        addChild(buildCenterBar())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLeftBar(var transform transform: CGAffineTransform) -> SKShapeNode {
        let width = CGFloat(style.sideBarWidth)
        let height = CGFloat(style.sideBarHeight)
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, -width, 2)
        CGPathAddLineToPoint(path, nil, 0, 2)
        CGPathAddLineToPoint(path, nil, 0, -height)
        CGPathAddLineToPoint(path, nil, -4, -height)
        CGPathAddLineToPoint(path, nil, -4, -2)
        CGPathAddLineToPoint(path, nil, -width, -2)
        CGPathCloseSubpath(path)

        let transformedPath = withUnsafeMutablePointer(&transform) {
            CGPathCreateMutableCopyByTransformingPath(path, $0)
        }
        
        let shape = SKShapeNode(path: transformedPath!)
        shape.fillColor = style.fillColor
        shape.strokeColor = style.strokeColor
        return shape
    }
    
    private func buildCenterBar() -> SKShapeNode {
        let halfWidth = CGFloat(style.centerBarWidth) / 2
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, -halfWidth, 2)
        CGPathAddLineToPoint(path, nil, halfWidth, 2)
        CGPathAddLineToPoint(path, nil, halfWidth, -2)
        CGPathAddLineToPoint(path, nil, -halfWidth, -2)
        CGPathCloseSubpath(path)
        
        let shape = SKShapeNode(path: path)
        shape.fillColor = style.fillColor
        shape.strokeColor = style.strokeColor
        return shape
    }
}
