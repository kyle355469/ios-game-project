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
    var gameMode = 0 // 0/1/2 normal/hard/vhard
    var coin = userdefault.object(forKey: "coin") as! Int?
    var lv = userdefault.object(forKey: "level") as! Int?
    var nor = userdefault.integer(forKey: "normal")
    var har = userdefault.integer(forKey: "hard")
    var vhar = userdefault.integer(forKey: "ex")
    var scored = 0
    var isNewHighest = false
    override func didMove(to view: SKView) {
        scored = getScoreCalculate()
        if (gameMode == 0 && scored > nor){
            isNewHighest = true
            userdefault.set(scored, forKey: "normal")
        } else if (gameMode == 1 && scored > har){
            isNewHighest = true
            userdefault.set(scored, forKey: "hard")
        } else if (gameMode == 2 && scored > vhar){
            isNewHighest = true
            userdefault.set(scored, forKey: "ex")
        }
        createScene()
        print(gameMode)
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
        let score = SKLabelNode(text: "\(scored)")
        score.fontName = "Arial"
        score.fontSize = 60
        score.fontColor = UIColor.black
        score.position = CGPoint(x: 0, y: -100)
        scoreText.addChild(score)
        addChild(scoreText)
        
        let highest = SKLabelNode(text: "🎉Highest🎉")
        highest.fontName = "Arial"
        highest.fontSize = 40
        highest.fontColor = UIColor.black
        highest.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
        
        if isNewHighest == true {
            addChild(highest)
        }
        
        coin! += getCoinCalculate()
        
        userdefault.set(coin!, forKey: "coin")
        userdefault.synchronize()
        
        //fileUpdate()
        buttonCreate()
        
        
    }
    func getScoreCalculate() -> Int {
        totalWolfHit * 100
    }
    func getCoinCalculate() -> Int {
        return totalWolfHit * 5
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "menuButton" {
                let starterScene = StarterScene(size: self.size)
                self.view?.presentScene(starterScene, transition: SKTransition.fade(withDuration: 1))
            }
            if touchedNode.name == "upgradeButton" {
                let upgradeScene = UpGradeScene(size: self.size)
                self.view?.presentScene(upgradeScene, transition: SKTransition.fade(withDuration: 1))
            }
            if touchedNode.name == "againButton" {
                let gameScene = GameScene(size: self.size)
                gameScene.gamePlayBar.buildBar()
                isCountDownDoing = false
                self.view?.presentScene(gameScene, transition: SKTransition.fade(withDuration: 1))
            }
            
        }
    }
    
    func buttonCreate() {
        let coinCountCrop = CGRect(x: 0.779, y: 0.187, width: 0.07, height: 0.032)
        let coinDisplayer = SKSpriteNode(texture: SKTexture(rect: coinCountCrop, in: AllWindows))
        coinDisplayer.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 100)
        coinDisplayer.size = CGSize(width: 150, height: 60)
        let coinCounter = SKLabelNode(text: "\(coin!)")
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
