//
//  EntityData.swift
//  Dragon Flight
//
//  Created by Jarred Davis on 5/5/17.
//  Copyright © 2017 HighWindLabs. All rights reserved.
//

import SpriteKit

struct EntityData {
    var imageName:String
    var name:String
    var zPosition:Int
    var initAlpha:CFloat
    var finalAlpha:CFloat
    var allowsRotation:Bool
    var categoryBitMask:UInt32
    var collisionBitMask:UInt32
    var contactTestBitMask:UInt32
    var physicsBodyType:EntityIds.Body
    
    var data:[String:Any] = [
        "imageName":"",
        "name":"",
        "zPosition":0,
        "initAlpha":0.0,
        "finalAlpha":1.0,
        "allowsRotation":false,
        "categoryBitMask":0,
        "collisionBitMask":0,
        "contactTestBitMask":0,
        "physicsBodyType":"none"
    ]
    
    init(data:[String:Any]) {
        self.imageName = data["imageName"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.zPosition = data["zPosition"] as? Int ?? 0
        self.initAlpha = data["initAlpha"] as? CFloat ?? 1.0
        self.finalAlpha = data["finalAlpha"] as? CFloat ?? 1.0
        self.allowsRotation = data["allowsRotation"] as? Bool ?? false
        self.categoryBitMask = EntityIds.Category.None.rawValue
        self.collisionBitMask = EntityIds.Category.None.rawValue
        self.contactTestBitMask = EntityIds.Category.None.rawValue
        self.physicsBodyType = .None
        
        if let cCat = data["categoryBitMask"] as? UInt32 {
            self.categoryBitMask = cCat
        }
        
        if let cCol = data["collisionBitMask"] as? UInt32 {
            self.collisionBitMask = cCol
        }
        
        if let cCon = data["contactTestBitMask"] as? UInt32 {
            self.contactTestBitMask = cCon
        }
        
        if let cBodyType = data["physicsBodyType"] as? String, let cBod = EntityIds.Body(rawValue: cBodyType){
            self.physicsBodyType = cBod
        }
        
    }
}
