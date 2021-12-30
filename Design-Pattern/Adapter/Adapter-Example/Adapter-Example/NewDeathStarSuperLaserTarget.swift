//
//  NewDeathStarSuperLaserTarget.swift
//  Adapter-Example
//
//  Created by SHIN YOON AH on 2021/12/01.
//

import Foundation

struct NewDeathStarSuperLaserTarget: NewDeathStarSuperLaserAiming {
    
    private let target: OldDeathStarSuperLaserTarget
    
    var angleV: Double {
        return Double(target.angleVertical)
    }
    
    var angleH: Double {
        return Double(target.angleHorizontal)
    }
    
    init(_ target: OldDeathStarSuperLaserTarget) {
        self.target = target
    }
}
