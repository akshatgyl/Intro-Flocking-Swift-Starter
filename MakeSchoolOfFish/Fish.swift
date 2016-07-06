//
//  Fish.swift
//  MakeSchoolOfFish
//
//  Created by Dion Larson on 6/28/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import SpriteKit

let NumberOfFish: Int = 32
let StartingSpeed: CGFloat = 0.25
let MaximumSpeed: CGFloat = 1.5
let ScreenMargin: CGFloat = -25

class Fish: SKSpriteNode {
    
    var velocity: CGPoint = CGPoint.zero
    var delegate: FishDelegate!
    
    // Cohension Constants
    let cohesionVisibleDistance: CGFloat = 160
    let cohesionWeight: CGFloat = 1000
    
    // Separation Constants
    let separationDistance: CGFloat = 60
    let separationWeight: CGFloat = 200
    
    // Alignment Constants
    let alignmentVisibleDistance: CGFloat = 160
    let alignmentWeight: CGFloat = 50
    
    // Food Constants
    let foodVisibleDistance: CGFloat = 240
    let foodWeight: CGFloat = 250
    
    // Ripple Constants
    let rippleVisibleDistance: CGFloat = 200
    let rippleWeight: CGFloat = 150
    
    // Steer towards other fish
    func calculateCohension() -> CGPoint {
        let visibleFishPositions = delegate.fishPositions(within: cohesionVisibleDistance, of: self)
        let cohesion = vectorToCenterPoint(of: visibleFishPositions)
        return cohesion / cohesionWeight
    }
    
    // Keep fish seperated so they do not overlap
    func calculateSeperation() -> CGPoint {
        let closeFishPositions = delegate.fishPositions(within: separationDistance, of: self)
        let seperation = vectorToCenterPoint(of: closeFishPositions) * -1
        return seperation / separationWeight
    }
    
    // Create a "hive mind" by mimicking nearby fish
    func calculateAlignment() -> CGPoint {
        let visibleFishVelocities = delegate.fishVelocities(within: alignmentVisibleDistance, of: self)
        let alignment = average(of: visibleFishVelocities)
        return alignment / alignmentWeight
    }
    
    // Head towards food (single tap)
    func calculateFood() -> CGPoint {
        if let foodLocation = delegate.foodLocation() {
            if foodLocation.distanceTo(position) < foodVisibleDistance {
                return vectorTo(point: foodLocation) / foodWeight
            }
        }
        return CGPoint.zero
    }
    
    // Scatter away from ripples (double tap)
    func calculateRipple() -> CGPoint {
        if let rippleLocation = delegate.rippleLocation() {
            if rippleLocation.distanceTo(position) < rippleVisibleDistance {
                return vectorTo(point: rippleLocation) / rippleWeight * -1
            }
        }
        return CGPoint.zero
    }
    
    func updateVelocity() {
        let cohesion = calculateCohension()
        let seperation = calculateSeperation()
        let alignment = calculateAlignment()
        let food = calculateFood()
        let ripple = calculateRipple()
        
        velocity = sum(of: [velocity, cohesion, seperation, alignment, food, ripple])
        clampVelocity()
    }
    
    func clampVelocity() {
        let speed = velocity.length()
        if speed > MaximumSpeed {
            velocity = velocity.normalized() * MaximumSpeed
        }
    }
    
    func vectorToCenterPoint(of points: [CGPoint]) -> CGPoint {
        if points.count == 0 {
            return CGPoint.zero
        }
        return vectorTo(point: average(of: points))
    }
    
    func vectorTo(point point: CGPoint) -> CGPoint {
        return point - position
    }
}

// MARK: Math Helpers

func sum(of points: [CGPoint]) -> CGPoint {
    // Or done with a for-loop
    return points.reduce(CGPoint.zero, combine: +)
}

func average(of points: [CGPoint]) -> CGPoint {
    if points.count == 0 {
        return CGPoint.zero
    }
    return sum(of: points) / CGFloat(points.count)
}
