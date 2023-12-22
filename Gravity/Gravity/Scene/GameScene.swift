//
//  GameScene.swift
//  Gravity
//
//  Created by Hidayat Abisena on 17/12/23.
//

import SpriteKit
import GameplayKit
import CoreMotion

enum CollisionType: UInt32 {
    case object = 1
    case boundary = 2
}

class GameScene: SKScene {
    
    var imageName: String
    
    init(size: CGSize, imageName: String) {
        self.imageName = imageName
        super.init(size: size)
        self.setupScene()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.imageName = "dota1" // Default image name
        super.init(coder: aDecoder)
        self.setupScene()
    }
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var helloImage: SKSpriteNode?
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Configure the image node
        self.helloImage = self.childNode(withName: "//helloImage") as? SKSpriteNode
        if let helloImage = self.helloImage {
            // Create a circular mask
            let mask = SKShapeNode(circleOfRadius: min(helloImage.size.width, helloImage.size.height) / 2)
            mask.fillColor = .black
            
            // Create a crop node and add a copy of the image as a child
            let cropNode = SKCropNode()
            cropNode.maskNode = mask
            let imageCopy = helloImage.copy() as! SKSpriteNode
            imageCopy.position = CGPoint.zero // Center the image in the crop node
            cropNode.addChild(imageCopy)
            
            // Add the crop node to the scene, positioned at the original image's position
            addChild(cropNode)
            cropNode.position = helloImage.position
            
            // Optionally, hide the original image if it should not be visible outside the mask
            helloImage.isHidden = true
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    private func setupScene() {
        // Set up the physics world's gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        // Set up the boundary
        let boundary = SKPhysicsBody(edgeLoopFrom: self.frame)
        boundary.categoryBitMask = CollisionType.boundary.rawValue
        self.physicsBody = boundary
        
        //        // Set up the object
        //        let object = SKSpriteNode(imageNamed: imageName)
        //        object.physicsBody = SKPhysicsBody(circleOfRadius: object.size.width / 2)
        //        object.physicsBody?.categoryBitMask = CollisionType.object.rawValue
        //        object.physicsBody?.contactTestBitMask = CollisionType.boundary.rawValue
        //        object.position = CGPoint(x: size.width / 2, y: size.height / 2)
        //        addChild(object)
    }
    
    //    override func didMove(to view: SKView) {
    //        // Set up the physics world's gravity
    //        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    //
    //        // Set up the boundary
    //        let boundary = SKPhysicsBody(edgeLoopFrom: self.frame)
    //        boundary.categoryBitMask = CollisionType.boundary.rawValue
    //        self.physicsBody = boundary
    //
    //        // Set up the object with the provided image name
    //        let object = SKSpriteNode(imageNamed: imageName)
    //        object.physicsBody = SKPhysicsBody(circleOfRadius: object.size.width / 2)
    //        object.physicsBody?.categoryBitMask = CollisionType.object.rawValue
    //        object.physicsBody?.contactTestBitMask = CollisionType.boundary.rawValue
    //        object.position = CGPoint(x: size.width / 2, y: size.height / 2)
    //        addChild(object)
    //    }
    //
    //    func updateMotion(accelerometerData: CMAccelerometerData?, gyroData: CMGyroData?) {
    //        // Use accelerometer and gyro data to update scene
    //        if let accelerometerData = accelerometerData {
    //            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 10, dy: accelerometerData.acceleration.y * 10)
    //        }
    //    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
}
