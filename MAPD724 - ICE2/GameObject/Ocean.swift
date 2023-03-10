//
//  Ocean.swift
//  MAPD722 - ICE1
//
//  Created by Charlene Cheung on 16/1/2023.
//

import GameplayKit
import SpriteKit

class Ocean: GameObject
{
    
    
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition =  Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    
    override func CheckBounds()
    {
        if(position.y <= -2253)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 2253
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }

}
