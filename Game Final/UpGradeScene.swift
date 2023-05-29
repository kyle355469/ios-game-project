//
//  UpGradeScene.swift
//  Game Final
//
//  Created by 洪聿鍇 on 2023/5/29.
//

import UIKit
import SpriteKit
import GameplayKit

class UpGradeScene: SKScene {
    let AllWindows = SKTexture(imageNamed: "Windows.png")
    let AllButton = SKTexture(imageNamed: "Button.png")
    var coinCount:Int = 0;
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
        
        let coinCountCrop = CGRect(x: 0.779, y: 0.187, width: 0.07, height: 0.032)
        let coinDisplayer = SKSpriteNode(texture: SKTexture(rect: coinCountCrop, in: AllWindows))
        coinDisplayer.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 100)
        coinDisplayer.size = CGSize(width: 150, height: 60)
        let coinCounter = SKLabelNode(text: "\(coinCount)")
        coinCounter.fontSize = 25
        coinCounter.zPosition = 1
        coinCounter.position = CGPoint(x: 40, y: -10)
        coinDisplayer.addChild(coinCounter)
        let coinIconCrop = CGRect(x: 0.854, y: 0.262, width: 0.029, height: 0.038)
        let coinIcon = SKSpriteNode(texture: SKTexture(rect: coinIconCrop, in: AllWindows))
        coinIcon.size = CGSize(width: 50, height: 50)
        coinIcon.zPosition = 1
        coinIcon.position = CGPoint(x: -44, y: -1)
        coinDisplayer.addChild(coinIcon)
        self.addChild(coinDisplayer)
        
        
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
