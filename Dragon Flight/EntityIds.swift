//
//  EntityIds.swift
//  Dragon Flight
//
//  Created by Jarred Davis on 5/15/17.
//  Copyright © 2017 HighWindLabs. All rights reserved.
//

import Foundation

struct EntityIds {
    enum Layer: Int {
        case None
        case Background
        case MovingBackground
        case Obstacle
        case Food
        case Stone
        case Foreground
        case Player
        case Monster
        case Extras
        case Frame
    }
    
    // Must be squares of 2 to move up
    enum Category: UInt32 {
        case None = 0
        case Player = 1
        case Obstacle = 2
        case Ground = 4
        case Food = 8
        case Edge = 16
        case Bugz = 32
        case Fish = 64
        case Fire = 128
        case Ceiling = 256
        case Bonus = 512
    }
    
    enum Body:String {
        case None = "none"
        case Circle = "circle"
        case Rect = "rect"
    }
    
    func BodyConverter(bodyAsString: String) -> Body? {
        return Body(rawValue: bodyAsString)
    }

}
