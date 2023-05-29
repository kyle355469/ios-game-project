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
        
        // gamemode bottom
        let selectionRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.039)
        let StartTexture = SKTexture(rect: selectionRect, in: AllButton)
        let normalButton = SKSpriteNode(texture: StartTexture)
        normalButton.size = CGSize(width: 250, height: 150)
        normalButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+200)
        normalButton.name = "normalButton"
        let nWord = SKLabelNode(text: "普通")
        nWord.name = "normalButton"
        nWord.position = CGPoint(x: 0, y: -2)
        nWord.fontName = "Arial-BoldMT"
        nWord.fontColor = UIColor.black
        nWord.zPosition = 1
        nWord.fontSize = 40
        normalButton.addChild(nWord)
        addChild(normalButton)
        
        let hardButton = SKSpriteNode(texture: StartTexture)
        hardButton.size = CGSize(width: 250, height: 150)
        hardButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        hardButton.name = "hardButton"
        let hWord = SKLabelNode(text: "困難")
        hWord.name = "hardButton"
        hWord.position = CGPoint(x: 0, y: -2)
        hWord.fontName = "Arial-BoldMT"
        hWord.fontColor = UIColor.black
        hWord.zPosition = 1
        hWord.fontSize = 40
        hardButton.addChild(hWord)
        addChild(hardButton)
        
        let diffButton = SKSpriteNode(texture: StartTexture)
        diffButton.size = CGSize(width: 250, height: 150)
        diffButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-200)
        diffButton.name = "diffButton"
        let dWord = SKLabelNode(text: "超難")
        dWord.name = "diffButton"
        dWord.position = CGPoint(x: 0, y: -2)
        dWord.fontName = "Arial-BoldMT"
        dWord.fontColor = UIColor.black
        dWord.zPosition = 1
        dWord.fontSize = 40
        diffButton.addChild(dWord)
        addChild(diffButton)
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
            if touchedNode.name == "normalButton" {
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: SKTransition.doorsOpenHorizontal(withDuration: 1))
            }
        }
    }
}
