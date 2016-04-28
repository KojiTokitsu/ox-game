//
//  GameViewController.swift
//  ox game
//
//  Created by 時津幸司 on 2016/04/22.
//  Copyright (c) 2016年 時津幸司. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, UIGestureRecognizerDelegate {
    var scene: GameScene!
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func didTap(sender: UITapGestureRecognizer) {
        let location = sender.locationInView(view)
        print("tapped at \(location.x), \(location.y)")
        let size: CGSize = UIScreen.mainScreen().bounds.size
        let reset_top = size.height - (256 + 176)
        let reset_bottom = size.height - 256
        if 0 < location.x && location.x < 176 && reset_top < location.y && location.y < reset_bottom {
                scene.reset()
        }
        else{
            scene.mark(location)
        }
    }
}
