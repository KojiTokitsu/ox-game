//
//  GameScene.swift
//  ox game
//
//  Created by 時津幸司 on 2016/04/22.
//  Copyright (c) 2016年 時津幸司. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var turn_o = true
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        anchorPoint = CGPoint(x: 0,y: 0)
        
        reset()
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func transform(w: CGFloat)->CGFloat {
        switch w {
        case let w where 0 < w && w < 80:
            return 0
        case let w where 80 < w && w < 160:
            return 80
        case let w where 160 < w && w < 240:
            return 160
        default:
            return -80
        }
    }
    
    func mark(location: CGPoint) {
        let imageName = turn_o ? "o" : "x"
        let sign = SKSpriteNode(imageNamed: imageName)
        let size: CGSize = UIScreen.mainScreen().bounds.size
        sign.position = CGPoint(x: transform(location.x), y: transform(size.height - location.y))
        sign.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(sign)
        turn_o = !turn_o
    }
    
    func reset(){
        removeAllChildren()
        
        let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(background)
        
        let reset = SKSpriteNode(imageNamed: "reset")
        reset.position = CGPoint(x: 0, y: 256)
        reset.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(reset)
    }
}
