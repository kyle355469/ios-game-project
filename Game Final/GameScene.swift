//
//  StarterScene.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//
import SpriteKit
import GameplayKit


let allPlayButton = SKTexture(imageNamed: "gameButton")

class Wolf: SKSpriteNode {
    var row = 0
    var jumpRow = -1
}

class GameScene: SKScene {
    var isGameOver = 0
    let buttonzPos = 2;
    let wolfzPos = 0;
    let swordzPos = 1;
    var isHard = 0
    var sheepCount:Int = 5
    var swordPos = 2
    var totalhitCount = 0;
    let sheep = SpriteSheet(texture: SKTexture(imageNamed: "sheep2.png"), rows: 3, columns: 4)
    
    let allWindows = SKTexture(imageNamed: "Windows")
    var sheepController: [SKSpriteNode] = []
    var wolfController: [Wolf] = []
    override func didMove(to view: SKView) {
        createScene()
    }
    
    func createScene(){
        let bg = SKSpriteNode(imageNamed: "gameBG")
        bg.name = "backGround"
        bg.size.width = self.size.width
        bg.size.height = self.size.height
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -1
        
        addChild(bg)
        
        let fence = SKSpriteNode(imageNamed: "fence")
        fence.size = CGSize(width: self.frame.maxX - self.frame.minX + 80, height: 240)
        fence.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 250)
        fence.zPosition = 0
        addChild(fence)
        
        let sword = swordCreation()
        sword.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
        addChild(sword)
        
        buttonCreation()
        sheepCreation()
        wolfCreation(40)
    }
    
    func swordCreation() -> SKSpriteNode {
        let bigSword = SKTexture(imageNamed: "sword")
        let tempS = SKSpriteNode(texture: SKTexture(rect: CGRect(x: 1300.0 / 3000.0, y: 0, width: 330.0/3000.0, height: 1), in: bigSword))
        tempS.size = CGSize(width: 70, height: 120)
        tempS.name = "sword"
        tempS.zPosition = CGFloat(swordzPos)
        
        return tempS
    }
    
    func sheepCreation() {
        
        let px = (self.frame.maxX - self.frame.minX - 60) / CGFloat(sheepCount)
        let py = self.frame.minY + 50
        for i in 1...sheepCount {
            let tempSheep = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
            tempSheep.position = CGPoint(x: Int(px * (CGFloat(i) - 0.5) + 30), y: Int(py))
            tempSheep.zPosition = CGFloat(50 - i)
            tempSheep.size = CGSize(width: 100, height: 100)
            tempSheep.name = "sheep"
            addChild(tempSheep)
            sheepController.append(tempSheep)
        }
    }
    
    func wolfCreation(_ newWolf:Int){
        // create
        let bigWolf = SKTexture(imageNamed: "wolf")
        let wolfrect = CGRect(x: 194.0 / 1200.0, y: 45.0 / 1200.0, width: 810.0 / 1200.0, height: 1150.0 / 1200.0)
        let wolfTexture = SKTexture(rect: wolfrect, in: bigWolf)
        let px = (self.frame.maxX - self.frame.minX - 40) / CGFloat(5)
        for _ in 1...newWolf {
            let tempWolf = Wolf(texture: wolfTexture)
            tempWolf.row = Int(arc4random()) % 3 + 1
            tempWolf.size = CGSize(width: 80, height: 80)
            tempWolf.position = CGPoint(x: px * (CGFloat(tempWolf.row) + 0.5) + 27.0, y: self.frame.midY - 130 + CGFloat(80 * (wolfController.count)))
            tempWolf.name = "wolf"
            tempWolf.zPosition = CGFloat(wolfzPos)
            if isHard == 1 {
                tempWolf.jumpRow = Int(arc4random()) % 3
                if tempWolf.jumpRow + tempWolf.row > 2 {
                    tempWolf.jumpRow -= 2
                }
            }
            addChild(tempWolf)
            wolfController.append(tempWolf)
        }
        
        
    }
    
    func buttonCreation(){
        let leftRect = CGRect(x: 72.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let leftTexture = SKTexture(rect: leftRect, in: allPlayButton)
        let leftButton = SKSpriteNode(texture: leftTexture)
        leftButton.size = CGSize(width: 100, height: 100)
        leftButton.position = CGPoint(x: self.frame.midX-65, y: self.frame.midY-230)
        leftButton.name = "leftButton"
        leftButton.zPosition = CGFloat(buttonzPos)
        
        let rightRect = CGRect(x: 271 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let rightTexture = SKTexture(rect: rightRect, in: allPlayButton)
        let rightButton = SKSpriteNode(texture: rightTexture)
        rightButton.size = CGSize(width: 100, height: 100)
        rightButton.position = CGPoint(x: self.frame.midX+65, y: self.frame.midY-230)
        rightButton.name = "rightButton"
        rightButton.zPosition = CGFloat(buttonzPos)
        
        let twiceLeftRect = CGRect(x: 985.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let twiceLeftTexture = SKTexture(rect: twiceLeftRect, in: allPlayButton)
        let twiceLeftButton = SKSpriteNode(texture: twiceLeftTexture)
        twiceLeftButton.size = CGSize(width: 100, height: 100)
        twiceLeftButton.position = CGPoint(x: self.frame.midX-130, y: self.frame.midY-300)
        twiceLeftButton.name = "twiceLeftButton"
        twiceLeftButton.zPosition = CGFloat(buttonzPos)
        
        let twiceRightRect = CGRect(x: 774.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let twiceRightTexture = SKTexture(rect: twiceRightRect, in: allPlayButton)
        let twiceRightButton = SKSpriteNode(texture: twiceRightTexture)
        twiceRightButton.size = CGSize(width: 100, height: 100)
        twiceRightButton.position = CGPoint(x: self.frame.midX+130, y: self.frame.midY-300)
        twiceRightButton.name = "twiceRightButton"
        twiceRightButton.zPosition = CGFloat(buttonzPos)
        
        let midRect = CGRect(x: 270.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let midTexture = SKTexture(rect: midRect, in: allPlayButton)
        let midButton = SKSpriteNode(texture: midTexture)
        midButton.size = CGSize(width: 100, height: 100)
        midButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-300)
        midButton.name = "midButton"
        midButton.zPosition = CGFloat(buttonzPos)
        let midText = SKLabelNode(text: "・")
        midText.fontSize = 500
        midText.fontColor = UIColor.black
        midText.zPosition = CGFloat(buttonzPos + 1)
        midText.position = CGPoint(x: -1, y: -180)
        midText.name = "midButton"
        midButton.addChild(midText)
        
        addChild(leftButton)
        addChild(rightButton)
        addChild(twiceLeftButton)
        addChild(twiceRightButton)
        addChild(midButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let px = (self.frame.maxX - self.frame.minX - 40) / CGFloat(5)
        if isGameOver != 1 {
            for touch in touches {
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                print(touchedNode.name)
                if touchedNode.name == "leftButton" {
                    swordPos -= 1;
                    if swordPos < 0 {
                        swordPos = 0
                    }
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                    moveDetection()
                }
                if touchedNode.name == "rightButton" {
                    swordPos += 1;
                    if swordPos > 4 {
                        swordPos = 4
                    }
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                    moveDetection()
                }
                if touchedNode.name == "twiceRightButton" {
                    swordPos += 2;
                    if swordPos > 4 {
                        swordPos = 4
                    }
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                    moveDetection()
                }
                if touchedNode.name == "twiceLeftButton" {
                    swordPos -= 2;
                    if swordPos < 0 {
                        swordPos = 0
                    }
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                    moveDetection()
                }
                if touchedNode.name == "midButton" {
                    moveDetection()
                }
            }
        }
        
    }
    func moveDetection() {
        let firstWolf = wolfController[0]
        if firstWolf.row == swordPos {
            firstWolf.removeFromParent()
            totalhitCount += 1
            wolfController.remove(at: 0)
        } else {
            firstWolf.removeFromParent()
            wolfController.remove(at: 0)
            let eater = SKSpriteNode(imageNamed: "wolf")
            eater.size = CGSize(width: 200, height: 200)
            eater.zPosition = 100
            eater.position = CGPoint(x: self.frame.maxX + 20, y: self.frame.minY + 20)
            let action = SKAction.sequence([SKAction.moveTo(x: self.frame.minX - 20, duration: 0.7), SKAction.removeFromParent()])
            eater.run(action)
            addChild(eater)
            if sheepController.count != 0 {
                let dieSheep = sheepController[sheepController.count - 1]
                dieSheep.removeFromParent()
                sheepController.remove(at: sheepController.count - 1)
            }
            
            print(sheepController.count)
        }
        
        for wolf in wolfController {
            wolf.position = CGPoint(x: wolf.position.x ,y: wolf.position.y - 80)
        }
        
        if wolfController.count < 20 {
            wolfCreation(20)
        }
        
        if sheepController.count == 0 {
            isGameOver = 1
            let gameOverTag = SKSpriteNode(texture: SKTexture(rect: CGRect(x: 2635.0 / 4868.0, y: 1003.0 / 3787.0, width: 660.0 / 4868.0, height: 700.0 / 3787.0), in: allWindows))
            gameOverTag.position = CGPoint(x: self.frame.minX - 200, y: self.frame.midY)
            gameOverTag.zPosition = 101
            gameOverTag.size = CGSize(width: 400, height: 200)
            let gameOverText = SKLabelNode(text: "Game Over")
            gameOverText.fontColor = UIColor.black
            gameOverText.fontSize = 50
            gameOverText.position = CGPoint(x: 0, y: -10)
            gameOverText.zPosition = 1
            gameOverText.fontName = "Arial-BoldMT"
            gameOverTag.addChild(gameOverText)
            
            let action = SKAction.sequence([SKAction.moveTo(x: self.frame.midX, duration: 0.5), SKAction.wait(forDuration: 2)])
            
            gameOverTag.run(action, completion: {
                let scoreScene = ScoreScene(size: self.size)
                self.view?.presentScene(scoreScene, transition: SKTransition.moveIn(with: .up, duration: 0.8))
            })
            addChild(gameOverTag)
            // game over icon 停一下 進結算頁面
        }
    }
    
}
