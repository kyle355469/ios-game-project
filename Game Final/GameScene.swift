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


class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        createScene()
    }
    
    func createScene(){
    }
}

