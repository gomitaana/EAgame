//
//  EndGameScene.swift
//  UberJump
//
//  Created by CompanyName on 10/24/14.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//

import SpriteKit

class EndGameScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        // Stars
        let star = SKSpriteNode(imageNamed: "Star")
        star.position = CGPoint(x: 25, y: self.size.height-30)
        addChild(star)
        
        let lblStars = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblStars.fontSize = 30
        lblStars.fontColor = SKColor.white
        lblStars.position = CGPoint(x: 50, y: self.size.height-40)
        lblStars.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        lblStars.text = String(format: "X %d", GameState.sharedInstance.stars)
        addChild(lblStars)
        
        // Score
        let lblScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblScore.fontSize = 60
        lblScore.fontColor = SKColor.white
        lblScore.position = CGPoint(x: self.size.width / 2, y: 300)
        lblScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblScore.text = String(format: "%d", GameState.sharedInstance.score)
        addChild(lblScore)
        
        // High Score
        let lblHighScore = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblHighScore.fontSize = 30
        lblHighScore.fontColor = SKColor.cyan
        lblHighScore.position = CGPoint(x: self.size.width / 2, y: 150)
        lblHighScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblHighScore.text = String(format: "Mejor Puntaje: %d", GameState.sharedInstance.highScore)
        addChild(lblHighScore)

        
        // Try again
        let lblTryAgain = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
        lblTryAgain.fontSize = 30
        lblTryAgain.fontColor = SKColor.white
        lblTryAgain.position = CGPoint(x: self.size.width / 2, y: 50)
        lblTryAgain.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblTryAgain.text = "Vuelve a intentarlo"
        lblTryAgain.isUserInteractionEnabled = true
        addChild(lblTryAgain)
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        self.view!.presentScene(gameScene)
        
    }
        
}
   

