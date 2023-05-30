//
//  ScoreScene.swift
//  Game Final
//
//  Created by 洪聿鍇 on 2023/5/30.
//

import UIKit
import SpriteKit
import GameKit

class ScoreScene: SKScene {
    override func didMove(to view: SKView) {
        createScene()
    }
    
    func createScene() {
        let bg = SKSpriteNode(imageNamed: "gameBG")
        bg.name = "backGround"
        bg.size.width = self.size.width
        bg.size.height = self.size.height
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -1
        
        addChild(bg)
        
        let menuRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.039)
        let menuTexture = SKTexture(rect: menuRect, in: AllButton)
        let menuButton = SKSpriteNode(texture: menuTexture)
        menuButton.size = CGSize(width: 300, height: 120)
        menuButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-200)
        menuButton.name = "menuButton"
        let menuWord = SKLabelNode(text: "back to menu")
        menuWord.name = "menuButton"
        menuWord.position = CGPoint(x: 0, y: -5)
        menuWord.fontName = "Arial-BoldMT"
        menuWord.fontColor = UIColor.black
        menuWord.zPosition = 1
        menuWord.fontSize = 35
        menuButton.addChild(menuWord)
        
        addChild(menuButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "menuButton" {
                let starterScene = StarterScene(size: self.size)
                self.view?.presentScene(starterScene, transition: SKTransition.fade(withDuration: 1))
            }
            
        }
    }
}
