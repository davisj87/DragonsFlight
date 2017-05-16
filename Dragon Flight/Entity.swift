//
//  EntityConst.swift
//  Dragon Flight
//
//  Created by Jarred Davis on 5/5/17.
//  Copyright © 2017 HighWindLabs. All rights reserved.
//

import SpriteKit

struct Entity {
    private var image = UIImage(named: "Spaceship")
    private var texture = SKTexture()
    private var size = CGSize(width: 5, height: 5)
    private var initColor = UIColor.clear
    private var finalColor = UIColor.white
    private var physicsBodyType = EntityIds.Body.None
    var name = ""
    var spriteNode = SKSpriteNode()
    var showPhyBody:Bool = false {
        didSet {
            self.addPhyBody()
        }
    }
    
    init(entityData: EntityData) {
        self.image = UIImage(named: entityData.imageName)
        if let cEntityImage = self.image {
            self.texture = SKTexture(image: cEntityImage)
        }
        self.size = self.texture.size()
        self.initColor = UIColor.white
        self.finalColor = UIColor.white
        self.name = entityData.name
        
        self.spriteNode = SKSpriteNode(imageNamed: entityData.imageName)
        self.spriteNode.name = self.name
        
        self.physicsBodyType = entityData.physicsBodyType
        
        switch entityData.physicsBodyType {
        case .Circle:
            self.spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: self.spriteNode.frame.width/2)
            break
        case .Rect:
            let rectSize = CGSize(width: self.spriteNode.frame.width, height: self.spriteNode.frame.height)
            self.spriteNode.physicsBody = SKPhysicsBody(rectangleOf: rectSize)
            break
        default:
            break
        }
        self.spriteNode.physicsBody?.allowsRotation = entityData.allowsRotation
        self.spriteNode.physicsBody?.categoryBitMask = entityData.categoryBitMask
        self.spriteNode.physicsBody?.contactTestBitMask = entityData.contactTestBitMask
        
    }
    
    private func addPhyBody() {
        let shape = SKShapeNode()
        var bezPath = UIBezierPath()
        
        switch self.physicsBodyType {
        case .Circle:
            bezPath = UIBezierPath(ovalIn: CGRect(x: -self.spriteNode.size.width/2, y: -self.spriteNode.size.height/2, width: self.spriteNode.size.width, height: self.spriteNode.size.height))
            break
        case .Rect:
            bezPath = UIBezierPath(rect: CGRect(x: -self.spriteNode.size.width/2, y: -self.spriteNode.size.height/2, width: self.spriteNode.size.width, height: self.spriteNode.size.height))
        break
        default:
            break
        
        }
        shape.path = bezPath.cgPath
        shape.strokeColor = UIColor.red
        shape.lineWidth = 1.0
        shape.isAntialiased = false
        
        self.spriteNode.addChild(shape)
    }
}




//
//- (void)setupPlayer {
//
//    if (_bigDragon == NO){
//        _player = [SKSpriteNode spriteNodeWithImageNamed:@"babyFly1@2x.png"];
//        _player.position = CGPointMake(self.size.width * 0.2, _playableHeight * 0.5);
//        _player.alpha = 0.0;
//
//        SKAction *fadeInDragon = [SKAction fadeInWithDuration:2];
//
//
//        [_playerNode addChild:_player];
//        [_player runAction:fadeInDragon];
//
//        [self setupEdgenode];
//    }
//    _bigDragon = NO;
//
//    flapStatus = StopFlapping;
//
//
//
//    [self flyingBabyDragon];
//
//
//    [_player setName:playerName];
//
//
//    // SKAction *physicsSetup = [SKAction runBlock:(dispatch_block_t)^() {
//    _player.physicsBody =[SKPhysicsBody bodyWithCircleOfRadius:_player.frame.size.width/3];
//    _player.physicsBody.allowsRotation = NO;
//    _player.physicsBody.categoryBitMask = EntityCategoryPlayer;
//    _player.physicsBody.collisionBitMask = 0;
//    _player.physicsBody.contactTestBitMask = EntityCategoryObstacle | EntityCategoryFood | EntityCategoryGround| EntityCategoryCeiling| EntityCategoryBugz |EntityCategoryFish;
//
//
//}
