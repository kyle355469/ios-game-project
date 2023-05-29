//
//  ChooseLevelScene.swift
//  Game Final
//
//  Created by 洪聿鍇 on 2023/5/29.
//

import SpriteKit
import GameplayKit

class ChooseLevelScene: SKScene {
    let AllButton = SKTexture(imageNamed: "Button.png")
    override func didMove(to view: SKView) {
        createScene()
    }
    func createScene(){
        let bg = SKSpriteNode(imageNamed: "gameBG")
        bg.size.width = self.size.width
        bg.size.height = self.size.height
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -1
        
        let croppingRect = CGRect(x: 0.1, y: 0.795, width:0.1, height: 0.039)
        let GoBackTexture = SKTexture(rect: croppingRect, in: AllButton)
        let GoBackButton = SKSpriteNode(texture: GoBackTexture)
        GoBackButton.size = CGSize(width: 60, height: 60)
        GoBackButton.position = CGPoint(x: self.frame.minX + 40, y: self.frame.maxY - 40)
        GoBackButton.name = "GoBackButton"
        
        addChild(bg)
        addChild(GoBackButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "GoBackButton" {
                let starterScene = StarterScene(size: self.size)
                self.view?.presentScene(starterScene)
                
                // Perform any actions or logic you desire
            }
        }
    }
}
