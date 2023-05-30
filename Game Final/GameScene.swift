//
//  StarterScene.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//
import SpriteKit
import GameplayKit


class Wolf: SKSpriteNode {
    var row = 0
    var jumpRow = -1
}

class GameScene: SKScene {
    let buttonzPos = 2;
    let wolfzPos = 0;
    let swordzPos = 1;
    var isHard = 0
    var sheepCount:Int = 7
    var swordPos = 1
    let sheep = SpriteSheet(texture: SKTexture(imageNamed: "sheep2.png"), rows: 3, columns: 4)
    let allPlayButton = SKTexture(imageNamed: "gameButton")
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
        fence.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 230)
        fence.zPosition = 0
        addChild(fence)
        
        let sword = swordCreation()
        sword.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
        addChild(sword)
        
        buttonCreation()
        sheepCreation()
        wolfCreation()
    }
    
    func swordCreation() -> SKSpriteNode {
        let bigSword = SKTexture(imageNamed: "sword")
        let tempS = SKSpriteNode(texture: SKTexture(rect: CGRect(x: 1300.0 / 3000.0, y: 0, width: 330.0/3000.0, height: 1), in: bigSword))
        tempS.size = CGSize(width: 70, height: 120)
        tempS.name = "sword"
        tempS.zPosition = CGFloat(swordPos)
        
        return tempS
    }
    
    func sheepCreation() {
        
        let px = (self.frame.maxX - self.frame.minX - 60) / CGFloat(sheepCount)
        let py = self.frame.minY + 50
        for i in 1...sheepCount {
            let tempSheep = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
            tempSheep.position = CGPoint(x: Int(px * (CGFloat(i) - 0.5) + 30), y: Int(py))
            tempSheep.zPosition = CGFloat(50 - i)
            tempSheep.name = "sheep"
            addChild(tempSheep)
            sheepController.append(tempSheep)
        }
    }
    
    func wolfCreation(){
        // create
        let bigWolf = SKTexture(imageNamed: "wolf")
        let wolfrect = CGRect(x: 194.0 / 1200.0, y: 45.0 / 1200.0, width: 810.0 / 1200.0, height: 1150.0 / 1200.0)
        let wolfTexture = SKTexture(rect: wolfrect, in: bigWolf)
        let px = (self.frame.maxX - self.frame.minX - 40) / CGFloat(3)
        for i in 1...80 {
            let tempWolf = Wolf(texture: wolfTexture)
            tempWolf.row = Int(arc4random()) % 3
            tempWolf.size = CGSize(width: 120, height: 120)
            tempWolf.position = CGPoint(x: px * (CGFloat(tempWolf.row) + 0.5) + 27.0, y: self.frame.midY - 130 + CGFloat(110 * (i - 1)))
            tempWolf.name = "wolf"
            tempWolf.zPosition = CGFloat(wolfzPos)
            if isHard == 1 {
                tempWolf.jumpRow = Int(arc4random()) % 2
                if tempWolf.jumpRow > 2 {
                    tempWolf.jumpRow -= 3
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
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            print(touchedNode.name)
            if touchedNode.name == "leftButton" {
                if swordPos > 0 {
                    swordPos -= 1;
                    let px = (self.frame.maxX - self.frame.minX - 40) / CGFloat(3)
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                }
                
            }
            if touchedNode.name == "rightButton" {
                if swordPos < 3 {
                    swordPos += 1;
                    let px = (self.frame.maxX - self.frame.minX - 40) / CGFloat(3)
                    let s = self.childNode(withName: "sword") as! SKSpriteNode
                    s.position = CGPoint(x: px * (CGFloat(swordPos) + 0.5) + 27.0, y: self.frame.midY - 200)
                }
                
            }
        }
    }
    
}
