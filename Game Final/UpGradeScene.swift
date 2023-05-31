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
    var coinCount:Int = 0;
    var sheepUpgradeLevel = 1;
    var cost = 0
    override func didMove(to view: SKView) {
        cost = costCalculation()
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
        coinDisplay()
        addSheepUpgrade()
    }
    
    func costCalculation() -> Int{
        return ((sheepUpgradeLevel * sheepUpgradeLevel / 2 + sheepUpgradeLevel * 2) * 100)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "GoBackButton" {
                let starterScene = StarterScene(size: self.size)
                starterScene.coinCount = self.coinCount
                starterScene.sheepCount = sheepUpgradeLevel
                self.view?.presentScene(starterScene)
                
                // Perform any actions or logic you desire
            }
            if touchedNode.name == "buyButton" || touchedNode.name == "cost" {
                if coinCount < cost {
                    print(coinCount)
                    let warning = SKLabelNode(text: "你錢不夠")
                    warning.fontColor = UIColor.black
                    warning.fontName = "Arial-BoldMT"
                    warning.fontSize = 35
                    warning.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
                    let action = SKAction.sequence([SKAction.wait(forDuration: 3), SKAction.removeFromParent()])
                    warning.run(action)
                    addChild(warning)
                }
                else {
                    coinCount -= cost
                    sheepUpgradeLevel += 1
                    cost = costCalculation()
                    let newCoinText = childNode(withName: "coin")?.childNode(withName: "coinCounter") as! SKLabelNode
                    newCoinText.text = "\(coinCount)"
                    let newLevelText = childNode(withName: "sheepTag")?.childNode(withName: "sheepLevel") as! SKLabelNode
                    newLevelText.text = "Lv.\(sheepUpgradeLevel)"
                    let newCostText = childNode(withName: "sheepTag")?.childNode(withName: "buyButton")?.childNode(withName: "cost") as! SKLabelNode
                    newCostText.text = "\(cost)"
                }
            }
        }
    }
    
    func coinDisplay() {
        let coinCountCrop = CGRect(x: 0.779, y: 0.187, width: 0.07, height: 0.032)
        let coinDisplayer = SKSpriteNode(texture: SKTexture(rect: coinCountCrop, in: AllWindows))
        coinDisplayer.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 70)
        coinDisplayer.size = CGSize(width: 150, height: 60)
        coinDisplayer.name = "coin"
        let coinCounter = SKLabelNode(text: "\(coinCount)")
        coinCounter.fontSize = 25
        coinCounter.name = "coinCounter"
        coinCounter.zPosition = 1
        coinCounter.position = CGPoint(x: 20, y: -10)
        coinDisplayer.addChild(coinCounter)
        let coinIconCrop = CGRect(x: 0.854, y: 0.262, width: 0.029, height: 0.038)
        let coinIcon = SKSpriteNode(texture: SKTexture(rect: coinIconCrop, in: AllWindows))
        coinIcon.size = CGSize(width: 50, height: 50)
        coinIcon.zPosition = 1
        coinIcon.position = CGPoint(x: -44, y: -1)
        coinDisplayer.addChild(coinIcon)
        self.addChild(coinDisplayer)
    }
    
    func addSheepUpgrade() {
        let sheepUpgradeTag = SKSpriteNode(texture: SKTexture(rect: CGRect(x: 2635.0 / 4868.0, y: 1003.0 / 3787.0, width: 660.0 / 4868.0, height: 700.0 / 3787.0), in: AllWindows))
        sheepUpgradeTag.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
        sheepUpgradeTag.zPosition = 1
        sheepUpgradeTag.size = CGSize(width: 380, height: 500)
        sheepUpgradeTag.name = "sheepTag"
        let sheepUpgradeText = SKLabelNode(text: "MORE SHEEP")
        sheepUpgradeText.fontColor = UIColor.black
        sheepUpgradeText.fontSize = 35
        sheepUpgradeText.position = CGPoint(x: 0, y: 130)
        sheepUpgradeText.zPosition = 1
        sheepUpgradeText.fontName = "Arial-BoldMT"
        sheepUpgradeTag.addChild(sheepUpgradeText)
        let SULevelText = SKLabelNode(text: "Lv.\(sheepUpgradeLevel)")
        SULevelText.fontSize = 18
        SULevelText.fontName = "Arial-BoldMT"
        SULevelText.fontColor = UIColor.black
        SULevelText.position = CGPoint(x: 0, y: 110)
        SULevelText.zPosition = 1
        SULevelText.name = "sheepLevel"
        sheepUpgradeTag.addChild(SULevelText)
        let sheepUpgradeIcon = SKSpriteNode()
        let SUI_part1 = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
        let SUI_part2 = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
        let SUI_part3 = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
        SUI_part1.size = CGSize(width: 200, height: 180)
        SUI_part2.size = CGSize(width: 200, height: 180)
        SUI_part3.size = CGSize(width: 200, height: 180)
        SUI_part1.position = CGPoint(x: -25, y: -10)
        SUI_part2.position = CGPoint(x: 0, y: 0)
        SUI_part3.position = CGPoint(x: +25, y: +10)
        SUI_part1.zPosition = 3
        SUI_part2.zPosition = 2
        SUI_part3.zPosition = 1
        sheepUpgradeIcon.addChild(SUI_part1)
        sheepUpgradeIcon.addChild(SUI_part2)
        sheepUpgradeIcon.addChild(SUI_part3)
        sheepUpgradeIcon.name = "sheepIcon"
        sheepUpgradeIcon.position = CGPoint(x: 0, y: 10)
        sheepUpgradeIcon.size = CGSize(width: 160, height: 160)
        sheepUpgradeTag.addChild(sheepUpgradeIcon)
        
        let buyRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.039)
        let buyTexture = SKTexture(rect: buyRect, in: AllButton)
        let buyButton = SKSpriteNode(texture: buyTexture)
        buyButton.size = CGSize(width: 160, height: 80)
        buyButton.position = CGPoint(x: 0, y: -140)
        buyButton.name = "buyButton"
        buyButton.zPosition = 2
        let buyWord = SKLabelNode(text: "\(cost)")
        buyWord.name = "cost"
        buyWord.position = CGPoint(x: 0, y: -5)
        buyWord.fontName = "Arial-BoldMT"
        buyWord.fontColor = UIColor.black
        buyWord.zPosition = 1
        buyWord.fontSize = 28
        buyButton.addChild(buyWord)
        sheepUpgradeTag.addChild(buyButton)
        
        addChild(sheepUpgradeTag)
    }
}
