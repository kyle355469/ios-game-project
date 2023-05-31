//
//  GameViewController.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//

import UIKit
import SpriteKit
import GameplayKit

var path = Bundle.main.path(forResource: "saver", ofType: "txt")
let data = try? Data(contentsOf: URL(fileURLWithPath: path!))
let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
var dataArray = dataString.components(separatedBy: "\n")
var gameData: [String: Int] = [:]
class GameViewController: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        for i in 0...dataArray.count-2 {
            let tempArray = dataArray[i].components(separatedBy: ":")
            gameData[tempArray[0]] = Int(tempArray[1])
        }
        if let view = self.view as! SKView? {
            let scene = StarterScene(size: view.bounds.size)
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
