//
//  StarterScene.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//
import SpriteKit
import GameplayKit

//class SpriteSheet {
//    let texture: SKTexture
//    let rows: Int
//    let columns: Int
//    var frameSize: CGSize {
//        CGSize(width: texture.size().width / CGFloat(columns),
//               height: texture.size().height / CGFloat(rows))
//    }
//
//    init(texture: SKTexture, rows: Int, columns: Int) {
//        self.texture = texturea
//        self.rows = rows
//        self.columns = columns
//    }
//
//    func sprite(atRow row: Int, column: Int) -> SKTexture {
//        let textureRect = CGRect(x: frameSize.width * CGFloat(column),
//                                 y: frameSize.height * CGFloat(row),
//                                 width: frameSize.width,
//                                 height: frameSize.height)
//        return SKTexture(rect: textureRect, in: texture)
//    }
//}


class StarterScene: SKScene {
    let sheep = SpriteSheet(texture: SKTexture(imageNamed: "sheep2.png"), rows: 3, columns: 4)
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
        
        
        let title = SKLabelNode(text: "有 狼 🐺")
        title.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 200)
        title.fontSize = 40
        title.fontColor = UIColor.black
        title.horizontalAlignmentMode = .center
        title.verticalAlignmentMode = .center
        applyBoldFont(to: title)
        
//        let sprite = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
//        sprite.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        let animateAction = SKAction.animate(with: [
//            sheep.textureForColumn(column: 0, row: 2),
//            sheep.textureForColumn(column: 1, row: 2),
//            sheep.textureForColumn(column: 0, row: 2),
//            sheep.textureForColumn(column: 1, row: 2),
//            sheep.textureForColumn(column: 0, row: 2),
//            sheep.textureForColumn(column: 2, row: 2),
//            sheep.textureForColumn(column: 0, row: 2),
//            sheep.textureForColumn(column: 2, row: 2)
//        ], timePerFrame: 0.1)
//        sprite.run(SKAction.repeatForever(animateAction))
//
        
        let croppingRect = CGRect(x: 0.3, y: 0.92, width:0.2, height: 0.039)
        let StartTexture = SKTexture(rect: croppingRect, in: AllButton)
        let startButton = SKSpriteNode(texture: StartTexture)
        startButton.size = CGSize(width: 200, height: 80)
        startButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY+50)
        startButton.name = "startButton"
        let startWord = SKLabelNode(text: "Start")
        startWord.name = "startButton"
        startWord.position = CGPoint(x: self.frame.midX, y: self.frame.midY+50)
        startWord.fontName = "Arial"
        startWord.fontColor = UIColor.black
        startWord.zPosition = 1
        startWord.fontSize = 28
        
        let upGradeTexture = SKTexture(rect: croppingRect, in: AllButton)
        let upGradeButton = SKSpriteNode(texture: upGradeTexture)
        upGradeButton.size = CGSize(width: 200, height: 80)
        upGradeButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        upGradeButton.name = "upGradeButton"
        let upGradeWord = SKLabelNode(text: "Upgrade")
        upGradeWord.name = "upGradeButton"
        upGradeWord.position = CGPoint(x: self.frame.midX, y: self.frame.midY-50)
        upGradeWord.fontName = "Arial"
        upGradeWord.fontColor = UIColor.black
        upGradeWord.zPosition = 1
        upGradeWord.fontSize = 28
        
        self.addChild(bg)
        self.addChild(title)
        //self.addChild(sprite)
        
        self.addChild(startWord)
        self.addChild(startButton)
        self.addChild(upGradeButton)
        self.addChild(upGradeWord)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "startButton" {
                // Button is tapped
                let sprite = SKSpriteNode(texture: sheep.textureForColumn(column: 0, row: 0))
                let a = arc4random() % UInt32(self.frame.maxX)
                let b = arc4random() % UInt32(self.frame.maxY)
                sprite.position = CGPoint(x: Int(a), y: Int(b))
                let animateAction = SKAction.animate(with: [
                    sheep.textureForColumn(column: 0, row: 0),
                    sheep.textureForColumn(column: 1, row: 0),
                    sheep.textureForColumn(column: 0, row: 0),
                    sheep.textureForColumn(column: 1, row: 0),
                    sheep.textureForColumn(column: 0, row: 0),
                    sheep.textureForColumn(column: 1, row: 0),
                    sheep.textureForColumn(column: 0, row: 0),
                    sheep.textureForColumn(column: 1, row: 0)
                ], timePerFrame: 0.1)
                sprite.run(SKAction.repeatForever(animateAction))
                self.addChild(sprite)
                
                // Perform any actions or logic you desire
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
