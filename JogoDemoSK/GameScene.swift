//
//  GameScene.swift
//  JogoDemoSK
//
//  Created by PEDRO HENRIQUE PEREIRA ELIAS DOS SANTOS on 01/12/17.
//  Copyright © 2017 PEDRO HENRIQUE PEREIRA ELIAS DOS SANTOS. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var objetoBola = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        objetoBola = childNodeWithName("bola") as! SKSpriteNode
        var objetoBola = childNode(withName: "bola")
        
        objetoBola?.position = CGPoint(x: 50, y:300)
        
        
        
        
        
        var leonardo = SKSpriteNode(imageNamed: "Nick")
        
        leonardo.position = CGPoint(x: 50, y:80)
        leonardo.texture?.filteringMode = .nearest //qualidade de pixel art
        leonardo.setScale(1.0)
        self.addChild(leonardo)
        
        // manual sem sequencias
       // leonardo.run(SKAction.moveBy(x: 400, y: 50, duration: 5))
        //leonardo.run(SKAction.fadeAlpha(by: 0, duration: 5)) //sumir
        
        //com sequencias (é mesmo valor do manual mas definido em uma sequencia)
         leonardo.run(SKAction.sequence([SKAction.moveBy(x: 400, y: 50, duration: 50) , SKAction.fadeAlpha(by: 0, duration: 5), SKAction.removeFromParent()]))
        
        
        let emitterPath: String = Bundle.main.path(forResource:"ParticulaFogo", ofType: "sks")!
        
        let emitterNode = NSKeyedUnarchiver.unarchiveObject(with: emitterPath) as! SKEmitterNode
        emitterNode.setScale(0.35)
        leonardo.addChild(emitterNode)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        println("Tocou")
        
        objetoBola.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 150))
    }
    
}
