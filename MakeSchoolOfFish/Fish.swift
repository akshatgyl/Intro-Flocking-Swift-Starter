//
//  Fish.swift
//  FishSim
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
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    // Keep fish separated so they do not overlap
    func calculateSeparation() -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    // Create a "hive mind" by mimicking nearby fish
    func calculateAlignment() -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    // Head towards food (single tap)
    func calculateFood() -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    // Scatter away from ripples (double tap)
    func calculateRipple() -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    func updateVelocity() {
        // Sum up all your rules and call clampVelocity!
        
    }
    
    func vectorToCenterPoint(of points: [CGPoint]) -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    func vectorTo(point point: CGPoint) -> CGPoint {
        // TODO: Implement this!
        return CGPoint(x: 0, y: 0)
    }
    
    // We implemented this for you. It takes the current velocity and makes sure
    // it is under the limit, otherwise, keeps the direction and sets to limit.
    func clampVelocity() {
        let speed = velocity.length()
        if speed > MaximumSpeed {
            velocity = velocity.normalized() * MaximumSpeed
        }
    }
}

// MARK: Math Helpers

func sum(of points: [CGPoint]) -> CGPoint {
    // TODO: Implement this!
    return CGPoint(x: 0, y: 0)
}

func average(of points: [CGPoint]) -> CGPoint {
    // TODO: Implement this!
    return CGPoint(x: 0, y: 0)
}
