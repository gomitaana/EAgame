//
//  GameObjectNode.swift
//  UberJump
//
//  Created by CompanyName on 10/23/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//

import SpriteKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


struct CollisionCategoryBitmask {
    static let Player: UInt32 = 0x00
    static let Star: UInt32 = 0x01
    static let Platform: UInt32 = 0x02
}

enum PlatformType: Int {
    case normal = 0
    case `break`
}

enum StarType: Int {
    case normal = 0
    case special
}

class GameObjectNode: SKNode {

    func collisionWithPlayer(_ player: SKNode) -> Bool {
        return false
    }
    
    func checkNodeRemoval(_ playerY: CGFloat) {
        if playerY > self.position.y + 300.0 {
            self.removeFromParent()
        }
    }
}

class PlatformNode: GameObjectNode {
    var platformType: PlatformType!
    
    override func collisionWithPlayer(_ player: SKNode) -> Bool {
        // 1
        // Only bounce the player if he's falling
        if player.physicsBody?.velocity.dy < 0 {
            // 2
            player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 250.0)
            
            // 3
            // Remove if it is a Break type platform
            if platformType == .break {
                self.removeFromParent()
            }
        }
        
        // 4
        // No stars for platforms
        return false
    }
}

class StarNode: GameObjectNode {
    var starType: StarType!
    //let starSound = SKAction.playSoundFileNamed("StarPing.wav", waitForCompletion: false)

    override func collisionWithPlayer(_ player: SKNode) -> Bool {
        // Boost the player up
        player.physicsBody?.velocity = CGVector(dx: player.physicsBody!.velocity.dx, dy: 400.0)
        
        // Remove this Star
        self.removeFromParent()
        
        // Award score
        GameState.sharedInstance.score += (starType == .normal ? 20 : 100)
        
        // Award stars
        GameState.sharedInstance.stars += (starType == .normal ? 1 : 5)
        
        // The HUD needs updating to show the new stars and score
        return true
    }
}
