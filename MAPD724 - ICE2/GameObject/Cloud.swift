//
//  Cloud.swift
//  MAPD724 - ICE2
//
//  Created by Charlene Cheung on 23/1/2023.
//

import SpriteKit
import GameplayKit

class Cloud: GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    
    override func CheckBounds()
    {
        if (position.y < -902)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the vertical speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
        
        
        position.y = 902
        // get a presudo random number -262 to 262
        let randomX: Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        // get a pseudo random number -262 to 262
        let randomY: Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
        position.x -= horizontalSpeed!
    }
}

