//
//  DragonConst.swift
//  Dragon Flight
//
//  Created by Jarred Davis on 5/5/17.
//  Copyright © 2017 HighWindLabs. All rights reserved.
//
import SpriteKit


struct Dragon {
    let entityData : [String: Any] = [
        "imageName":"TestBaby3",
        "name":"dragon",
        "zPosition":EntityIds.Layer.Player.rawValue,
        "initAlpha":0.5,
        "finalAlpha":1.0,
        "allowsRotation":false,
        "categoryBitMask":EntityIds.Category.Player.rawValue,
        "collisionBitMask":EntityIds.Category.None.rawValue,
        "contactTestBitMask":EntityIds.Category.Ceiling.rawValue | EntityIds.Category.Obstacle.rawValue,
        "physicsBodyType":EntityIds.Body.Circle.rawValue
    ]
}


//    let babyImage = UIImage(named: "")
//    var babyTexture: SKTexture {
//        guard let cBabyImage = self.babyImage else {
//            return SKTexture()
//        }
//        return SKTexture(image: cBabyImage)
//    }
//    let babyInitColor = UIColor.clear
//    let babyFinalColor = UIColor.white
//    let babyName = "baby"
