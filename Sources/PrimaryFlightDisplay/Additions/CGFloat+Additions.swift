//
//  CGFloat+Additions.swift
//  PrimaryFlightDisplay
//
//  Created by Michael Koukoullis on 27/02/2016.
//  Copyright © 2016 Michael Koukoullis. All rights reserved.
//

import SpriteKit

extension CGFloat {
    
    public static var degreesPerRadian: CGFloat {
       return CGFloat(180.0 / .pi)
    }
    
    public static var radiansPerDegree: CGFloat {
       return CGFloat(.pi / 180.0)
    }
}
