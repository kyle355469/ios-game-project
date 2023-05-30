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
    var totalWolfHit = 0
    var coinCount = 0
    var sheepCount = 0
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
        
        let scoreText = SKLabelNode(text: "Score")
        scoreText.fontName = "Arial-BoldMT"
        scoreText.fontSize = 80
        scoreText.fontColor = UIColor.black
        scoreText.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 250)
        let score = SKLabelNode(text: "\(totalWolfHit)")
        score.fontName = "Arial"
        score.fontSize = 60
        score.fontColor = UIColor.black
        score.position = CGPoint(x: 0, y: -100)
        scoreText.addChild(score)
        addChild(scoreText)
        
        
        coinCount += getCoinCalculate()
        buttonCreate()
        
        
    }
    
    func getCoinCalculate() -> Int {
        return totalWolfHit * 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "menuButton" {
                let starterScene = StarterScene(size: self.size)
                starterScene.coinCount = self.coinCount
                starterScene.sheepCount = self.sheepCount
                self.view?.presentScene(starterScene, transition: SKTransition.fade(withDuration: 1))
            }
            if touchedNode.name == "upgradeButton" {
                let upgradeScene = UpGradeScene(size: self.size)
                upgradeScene.coinCount = self.coinCount
                upgradeScene.sheepUpgradeLevel = self.sheepCount
                self.view?.presentScene(upgradeScene, transition: SKTransition.fade(withDuration: 1))
            }
            if touchedNode.name == "againButton" {
                let gameScene = GameScene(size: self.size)
                gameScene.coinCount = self.coinCount
                gameScene.sheepCount = self.sheepCount
                self.view?.presentScene(gameScene, transition: SKTransition.fade(withDuration: 1))
            }
            
        }
    }
    
    func buttonCreate() {
        let coinCountCrop = CGRect(x: 0.779, y: 0.187, width: 0.07, height: 0.032)
        let coinDisplayer = SKSpriteNode(texture: SKTexture(rect: coinCountCrop, in: AllWindows))
        coinDisplayer.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 100)
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
        
        let menuRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.0395)
        let menuTexture = SKTexture(rect: menuRect, in: AllButton)
        let menuButton = SKSpriteNode(texture: menuTexture)
        menuButton.size = CGSize(width: 340, height: 120)
        menuButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-210)
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
        
        let upgradeRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.0395)
        let upgradeTexture = SKTexture(rect: upgradeRect, in: AllButton)
        let upgradeButton = SKSpriteNode(texture: upgradeTexture)
        upgradeButton.size = CGSize(width: 160, height: 90)
        upgradeButton.position = CGPoint(x: self.frame.midX + 85, y: self.frame.midY-100)
        upgradeButton.name = "upgradeButton"
        let upgradeWord = SKLabelNode(text: "upgrade")
        upgradeWord.name = "upgradeButton"
        upgradeWord.position = CGPoint(x: 0, y: -5)
        upgradeWord.fontName = "Arial-BoldMT"
        upgradeWord.fontColor = UIColor.black
        upgradeWord.zPosition = 1
        upgradeWord.fontSize = 32
        upgradeButton.addChild(upgradeWord)
        
        addChild(upgradeButton)
        
        let againRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.0395)
        let againTexture = SKTexture(rect: againRect, in: AllButton)
        let againButton = SKSpriteNode(texture: againTexture)
        againButton.size = CGSize(width: 160, height: 90)
        againButton.position = CGPoint(x: self.frame.midX - 85, y: self.frame.midY-100)
        againButton.name = "againButton"
        let againWord = SKLabelNode(text: "again")
        againWord.name = "againButton"
        againWord.position = CGPoint(x: 0, y: -5)
        againWord.fontName = "Arial-BoldMT"
        againWord.fontColor = UIColor.black
        againWord.zPosition = 1
        againWord.fontSize = 32
        againButton.addChild(againWord)
        
        addChild(againButton)
    }
}
