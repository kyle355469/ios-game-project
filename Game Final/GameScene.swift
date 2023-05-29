//
//  StarterScene.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//
import SpriteKit
import GameplayKit




class GameScene: SKScene {
    var sheepCount:Int = 7
    let sheep = SpriteSheet(texture: SKTexture(imageNamed: "sheep2.png"), rows: 3, columns: 4)
    let allPlayButton = SKTexture(imageNamed: "gameButton")
    var sheepController: [SKSpriteNode] = []
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
        
        let leftRect = CGRect(x: 72.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let leftTexture = SKTexture(rect: leftRect, in: allPlayButton)
        let leftButton = SKSpriteNode(texture: leftTexture)
        leftButton.size = CGSize(width: 100, height: 100)
        leftButton.position = CGPoint(x: self.frame.midX-65, y: self.frame.midY-230)
        leftButton.name = "leftButton"
        
        let rightRect = CGRect(x: 271 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let rightTexture = SKTexture(rect: rightRect, in: allPlayButton)
        let rightButton = SKSpriteNode(texture: rightTexture)
        rightButton.size = CGSize(width: 100, height: 100)
        rightButton.position = CGPoint(x: self.frame.midX+65, y: self.frame.midY-230)
        rightButton.name = "rightButton"
        
        let twiceLeftRect = CGRect(x: 985.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let twiceLeftTexture = SKTexture(rect: twiceLeftRect, in: allPlayButton)
        let twiceLeftButton = SKSpriteNode(texture: twiceLeftTexture)
        twiceLeftButton.size = CGSize(width: 100, height: 100)
        twiceLeftButton.position = CGPoint(x: self.frame.midX-130, y: self.frame.midY-300)
        twiceLeftButton.name = "twiceLeftButton"
        
        let twiceRightRect = CGRect(x: 774.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let twiceRightTexture = SKTexture(rect: twiceRightRect, in: allPlayButton)
        let twiceRightButton = SKSpriteNode(texture: twiceRightTexture)
        twiceRightButton.size = CGSize(width: 100, height: 100)
        twiceRightButton.position = CGPoint(x: self.frame.midX+130, y: self.frame.midY-300)
        twiceRightButton.name = "twiceRightButton"
        
        let midRect = CGRect(x: 270.0 / 1200.0, y: 534.0 / 1200.0, width: 144.0 / 1200.0, height: 156.0 / 1200.0)
        let midTexture = SKTexture(rect: midRect, in: allPlayButton)
        let midButton = SKSpriteNode(texture: midTexture)
        midButton.size = CGSize(width: 100, height: 100)
        midButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-300)
        midButton.name = "midButton"
        let midText = SKLabelNode(text: "・")
        midText.fontSize = 500
        midText.fontColor = UIColor.black
        midText.zPosition = 1
        midText.position = CGPoint(x: -1, y: -180)
        midText.name = "midButton"
        midButton.addChild(midText)
        
        addChild(leftButton)
        addChild(rightButton)
        addChild(twiceLeftButton)
        addChild(twiceRightButton)
        addChild(midButton)
        sheepCreation()
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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            print(touchedNode.name)
        }
    }
    
}
