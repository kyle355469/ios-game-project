//
//  GameViewController.swift
//  Game Final
//
//  Created by Mac22 on 2023/5/29.
//

import UIKit
import SpriteKit
import GameplayKit

//var path = Bundle.main.path(forResource: "saver", ofType: "txt")
//var data = try? Data(contentsOf: URL(fileURLWithPath: path!))
//var dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
//var dataArray = dataString.components(separatedBy: "\n")
//var gameData: [String: Int] = [:]


//let fileManager = FileManager.default
//let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
//let fileURL = documentsDirectory?.appendingPathComponent("saver.txt")

var userdefault : UserDefaults = UserDefaults.standard

class GameViewController: UIViewController {
    override func viewDidLoad() {
       super.viewDidLoad()
        let check = userdefault.object(forKey: "coin") as! Int?
        if check == nil {
            userdefault.set(10000, forKey: "coin")
            userdefault.set(1, forKey: "level")
            userdefault.set(0, forKey: "normal")
            userdefault.set(0, forKey: "hard")
            userdefault.set(0, forKey: "ex")
            userdefault.synchronize()
        }
//        for i in 0...dataArray.count-2 {
//            let tempArray = dataArray[i].components(separatedBy: ":")
//            gameData[tempArray[0]] = Int(tempArray[1])
//        }
        if let view = self.view as! SKView? {
            let scene = StarterScene(size: view.bounds.size)
            view.presentScene(scene)
            view.preferredFramesPerSecond = 60
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


//func fileUpdate() {
//    var str: String = ""
//    for i in 0...dataArray.count-2 {
//        let tempArray = dataArray[i].components(separatedBy: ":")
//        let appender: String = "\(tempArray[0]):\(String(gameData[tempArray[0]]!))\n"
//        str = str + appender
//    }
//    do{
//        try str.write(to: URL(fileURLWithPath: path!), atomically: true, encoding: .utf8)
//        print("success")
//    } catch {
//        print("error: \(error)")
//    }
//
//    if let fileURL = fileURL {
//        // Check if the file exists
//        if Game_Final.fileManager.fileExists(atPath: fileURL.path) {
//            // Open the file for reading and writing
//            if let fileHandle = try? FileHandle(forUpdating: fileURL) {
//
//                for i in 0...dataArray.count-2 {
//                    let tempArray = dataArray[i].components(separatedBy: ":")
//                    let appender: String = "\(tempArray[0]):\(String(gameData[tempArray[0]]!))\n"
//                    str = str + appender
//                }
//                fileHandle.write(str.data(using: .utf8)!)
//                // Perform read/write operations on the file
//                // For example, write data to the file
////                    let dataToWrite = "Hello, World!".data(using: .utf8)
////                    fileHandle.write(dataToWrite!)
////
////                    // Read data from the file
////                    let fileData = fileHandle.readDataToEndOfFile()
////                    if let fileContent = String(data: fileData, encoding: .utf8) {
////                        print("File content: \(fileContent)")
////                    }
////
//                // Close the file handle
//                fileHandle.closeFile()
//            } else {
//                print("Unable to open the file for reading and writing.")
//            }
//        } else {
//            print("The file does not exist.")
//        }
//    } else {
//        print("Unable to access the Documents directory.")
//    }
//
//}
