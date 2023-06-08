//
//  StarterScene.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//
import SpriteKit
import GameplayKit

let AllButton = SKTexture(imageNamed: "Button.png")
let AllWindows = SKTexture(imageNamed: "Windows.png")
let sheep = SpriteSheet(texture: SKTexture(imageNamed: "sheep2.png"), rows: 3, columns: 4)
class StarterScene: SKScene {
    
    var coin = userdefault.object(forKey: "coin") as! Int?
    var lv = userdefault.object(forKey: "level") as! Int?
    
    override func didMove(to view: SKView) {
        createScene()
    }
    
    func createScene(){
        let bg = SKSpriteNode(imageNamed: "gameBG")
        bg.size.width = self.size.width
        bg.size.height = self.size.height
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -1
        
        
        let title = SKLabelNode(text: "有 狼 🐺")
        title.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
        title.fontSize = 40
        title.fontColor = UIColor.black
        title.horizontalAlignmentMode = .center
        title.verticalAlignmentMode = .center
        applyBoldFont(to: title)
        
        let coinCountCrop = CGRect(x: 0.779, y: 0.187, width: 0.07, height: 0.032)
        let coinDisplayer = SKSpriteNode(texture: SKTexture(rect: coinCountCrop, in: AllWindows))
        coinDisplayer.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 100)
        coinDisplayer.size = CGSize(width: 150, height: 60)
        let coinCounter = SKLabelNode(text: "\(coin!)")
        coinCounter.fontSize = 18
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
        
        let sprite = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY-300)
        let animateAction = SKAction.animate(with: [
            sheep.textureForColumn(column: 0, row: 2),
            sheep.textureForColumn(column: 1, row: 2),
            sheep.textureForColumn(column: 0, row: 2),
            sheep.textureForColumn(column: 1, row: 2),
            sheep.textureForColumn(column: 0, row: 2),
            sheep.textureForColumn(column: 2, row: 2),
            sheep.textureForColumn(column: 0, row: 2),
            sheep.textureForColumn(column: 2, row: 2)
        ], timePerFrame: 0.1)
        sprite.run(SKAction.repeatForever(animateAction))

        
        let croppingRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.039)
        let StartTexture = SKTexture(rect: croppingRect, in: AllButton)
        let startButton = SKSpriteNode(texture: StartTexture)
        startButton.size = CGSize(width: 200, height: 80)
        startButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+20)
        startButton.name = "startButton"
        let startWord = SKLabelNode(text: "Start")
        startWord.name = "startButton"
        startWord.position = CGPoint(x: 0, y: -5)
        startWord.fontName = "Arial"
        startWord.fontColor = UIColor.black
        startWord.zPosition = 1
        startWord.fontSize = 28
        startButton.addChild(startWord)
        
        
        let upGradeTexture = SKTexture(rect: croppingRect, in: AllButton)
        let upGradeButton = SKSpriteNode(texture: upGradeTexture)
        upGradeButton.size = CGSize(width: 200, height: 80)
        upGradeButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-80)
        upGradeButton.name = "upGradeButton"
        let upGradeWord = SKLabelNode(text: "Upgrade")
        upGradeWord.name = "upGradeButton"
        upGradeWord.position = CGPoint(x: 0, y: -5)
        upGradeWord.fontName = "Arial"
        upGradeWord.fontColor = UIColor.black
        upGradeWord.zPosition = 1
        upGradeWord.fontSize = 28
        upGradeButton.addChild(upGradeWord)
        
        let highestTexture = SKTexture(rect: croppingRect, in: AllButton)
        let highestButton = SKSpriteNode(texture: highestTexture)
        highestButton.size = CGSize(width: 200, height: 80)
        highestButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-180)
        highestButton.name = "highestButton"
        let highestWord = SKLabelNode(text: "highest")
        highestWord.name = "highestButton"
        highestWord.position = CGPoint(x: 0, y: -5)
        highestWord.fontName = "Arial"
        highestWord.fontColor = UIColor.black
        highestWord.zPosition = 1
        highestWord.fontSize = 28
        highestButton.addChild(highestWord)
        
        self.addChild(bg)
        self.addChild(title)
        self.addChild(sprite)
        
        self.addChild(startButton)
        self.addChild(upGradeButton)
        self.addChild(highestButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "startButton" {
                let chooseLevelScene = ChooseLevelScene(size: self.size)
                self.view?.presentScene(chooseLevelScene)
            }
            else if touchedNode.name == "upGradeButton" {
                let upgradeScene = UpGradeScene(size: self.size)
                self.view?.presentScene(upgradeScene)
            }
        }
    }
    func applyBoldFont(to labelNode: SKLabelNode) {
        let fontName = "Arial-BoldMT"
        let fontSize: CGFloat = 60
        
        let boldFont = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedText = NSAttributedString(string: labelNode.text ?? "", attributes: attributes)
        
        labelNode.fontName = fontName
        labelNode.fontSize = fontSize
        labelNode.attributedText = attributedText
    }
}


class SpriteSheet {
    let texture: SKTexture
    let rows: Int
    let columns: Int
    var margin: CGFloat=0
    var spacing: CGFloat=0
    var frameSize: CGSize {
        return CGSize(width: (self.texture.size().width-(self.margin*2+self.spacing*CGFloat(self.columns-1)))/CGFloat(self.columns),
            height: (self.texture.size().height-(self.margin*2+self.spacing*CGFloat(self.rows-1)))/CGFloat(self.rows))
    }

    init(texture: SKTexture, rows: Int, columns: Int, spacing: CGFloat, margin: CGFloat) {
        self.texture=texture
        self.rows=rows
        self.columns=columns
        self.spacing=spacing
        self.margin=margin

    }

    convenience init(texture: SKTexture, rows: Int, columns: Int) {
        self.init(texture: texture, rows: rows, columns: columns, spacing: 0, margin: 0)
    }

    func textureForColumn(column: Int, row: Int)->SKTexture {

        var textureRect=CGRect(x: self.margin+CGFloat(column)*(self.frameSize.width+self.spacing)-self.spacing,
                               y: self.margin+CGFloat(row)*(self.frameSize.height+self.spacing)-self.spacing,
                               width: self.frameSize.width,
                               height: self.frameSize.height)

        textureRect=CGRect(x: textureRect.origin.x/self.texture.size().width, y: textureRect.origin.y/self.texture.size().height,
            width: textureRect.size.width/self.texture.size().width, height: textureRect.size.height/self.texture.size().height)
        return SKTexture(rect: textureRect, in: self.texture)
    }
}
