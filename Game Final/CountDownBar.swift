//
//  CountDownBar.swift
//  Game Final
//
//  Created by 洪聿鍇 on 2023/6/7.
//

import SpriteKit
var isCountDownDoing = false
var doWolfmove = false
class CountDownBar: SKSpriteNode {
    private var barLen = CGFloat(5)
    private var nowLen = CGFloat(0.0)
    var countDownTime = Float(1.5)
    
    var isGameStart: Bool = false
    
    var bar = SKSpriteNode()
    var runner = SKSpriteNode()
    var insideBar = SKTexture(imageNamed: "yellowBar")
    var outsideBar = SKTexture(imageNamed: "blackBar")
    
    func buildBar(){
        self.removeAllChildren()
        bar = SKSpriteNode(texture: outsideBar)
        bar.size = CGSize(width: 200, height: 40)
        runner = SKSpriteNode(texture: insideBar)
        runner.size = CGSize(width: 195, height: 35)
        runner.zPosition = 1
        runner.position = CGPoint(x: 97.5, y: 0)
        runner.anchorPoint = CGPoint(x: 1, y: 0.5)
        addChild(bar)
        addChild(runner)
    }
    
    func refillBar() {
        runner.run(SKAction.scaleX(to: 1, duration: 0))
    }
    
    func updateBar() {
        isCountDownDoing = true
        if countDownTime >= 1.0 {
            countDownTime *= 0.993
        }else if countDownTime >= 0.6 {
            countDownTime *= 0.997
        }else if countDownTime >= 0.35 {
            countDownTime *= 0.99
        }
        print(countDownTime)
        runner.run(SKAction.sequence([SKAction.scaleX(to: 0, duration: TimeInterval(countDownTime)), SKAction.scaleX(to: 1, duration: 0)]), completion: {
            isCountDownDoing = false
            doWolfmove = true
        })
    }
}
