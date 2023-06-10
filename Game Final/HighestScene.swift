//
//  HighestScene.swift
//  Game Final
//
//  Created by 洪聿鍇 on 2023/5/31.
//

import UIKit
import SpriteKit

class HighestScene: SKScene {
    override func didMove(to view: SKView) {
        createScene()
    }
    
    func createScene() {
        let bg = SKSpriteNode(imageNamed: "gameBG")
        bg.size.width = self.size.width
        bg.size.height = self.size.height
        bg.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bg.zPosition = -1
        
        addChild(bg)
        
        let croppingRect = CGRect(x: 0.1, y: 0.795, width:0.1, height: 0.039)
        let GoBackTexture = SKTexture(rect: croppingRect, in: AllButton)
        let GoBackButton = SKSpriteNode(texture: GoBackTexture)
        GoBackButton.size = CGSize(width: 60, height: 60)
        GoBackButton.position = CGPoint(x: self.frame.minX + 40, y: self.frame.maxY - 40)
        GoBackButton.name = "GoBackButton"
        
        addChild(GoBackButton)
        
        let BoardRect = CGRect(x: 3563.0 / 4868.0, y: 3621.0 / 3787.0, width: 735 / 4868.0, height: 166 / 3787.0)
        let BoardTexture = SKTexture(rect: BoardRect, in: AllWindows)
        let NBoardButton = SKSpriteNode(texture: BoardTexture)
        NBoardButton.size = CGSize(width: 400, height: 100)
        NBoardButton.position = CGPoint(x: self.frame.midX + 5, y: self.frame.midY + 280)
        NBoardButton.name = "NBoardButton"
        
        let nWord = SKLabelNode(text: "普通")
        nWord.name = "normalButton"
        nWord.position = CGPoint(x: 0, y: -2)
        nWord.fontName = "Arial-BoldMT"
        nWord.fontColor = UIColor.black
        nWord.zPosition = 1
        nWord.fontSize = 40
        NBoardButton.addChild(nWord)
        
        let nScore = SKLabelNode(text: "\(userdefault.integer(forKey: "normal"))")
        nScore.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 170)
        nScore.fontName = "Arial"
        nScore.fontColor = .black
        nScore.fontSize = 80
        addChild(nScore)
        addChild(NBoardButton)
        
        let HBoardButton = SKSpriteNode(texture: BoardTexture)
        HBoardButton.size = CGSize(width: 400, height: 100)
        HBoardButton.position = CGPoint(x: self.frame.midX + 5, y: self.frame.midY + 50)
        HBoardButton.name = "HBoardButton"
        
        let hWord = SKLabelNode(text: "困難")
        hWord.name = "normalButton"
        hWord.position = CGPoint(x: 0, y: -2)
        hWord.fontName = "Arial-BoldMT"
        hWord.fontColor = UIColor.black
        hWord.zPosition = 1
        hWord.fontSize = 40
        HBoardButton.addChild(hWord)
        
        let hScore = SKLabelNode(text: "\(userdefault.integer(forKey: "hard"))")
        hScore.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 60)
        hScore.fontName = "Arial"
        hScore.fontColor = .black
        hScore.fontSize = 80
        addChild(hScore)
        addChild(HBoardButton)
        
        let VBoardButton = SKSpriteNode(texture: BoardTexture)
        VBoardButton.size = CGSize(width: 400, height: 100)
        VBoardButton.position = CGPoint(x: self.frame.midX + 5, y: self.frame.midY - 160)
        VBoardButton.name = "VBoardButton"
        
        let vWord = SKLabelNode(text: "超難")
        vWord.name = "vhardButton"
        vWord.position = CGPoint(x: 0, y: -2)
        vWord.fontName = "Arial-BoldMT"
        vWord.fontColor = UIColor.black
        vWord.zPosition = 1
        vWord.fontSize = 40
        VBoardButton.addChild(vWord)
        
        let vScore = SKLabelNode(text: "\(userdefault.integer(forKey: "ex"))")
        vScore.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 270)
        vScore.fontName = "Arial"
        vScore.fontColor = .black
        vScore.fontSize = 80
        addChild(vScore)
        addChild(VBoardButton)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "GoBackButton" {
                let starterScene = StarterScene(size: self.size)
                self.view?.presentScene(starterScene, transition: SKTransition.push(with: SKTransitionDirection.right, duration: 0.5))
            }
        }
    }
}
