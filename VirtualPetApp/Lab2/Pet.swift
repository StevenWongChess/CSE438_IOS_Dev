//
//  Pet.swift
//  Lab2
//
//  Created by Steven Wong on 20/9/2021.
//

import Foundation
import UIKit

class Pet{
    let MaxLevel:Int = 3
    let name:String
    let bgColor:UIColor
    let picture:UIImage
    
    var stdout:String = ""
    var happiness:Int = 5
    var foodLevel:Int = 5
    var level:Int = 1;
    var totalPlay:Int = 0
    var totalFeed:Int = 0
    var maxHappiness = 10
    var maxFood = 10
    
    init(name:String, bgColor:UIColor, picture:UIImage) {
        self.name = name
        self.bgColor = bgColor
        self.picture = picture
    }
    
    func play(){
//        print(happiness)
        stdout = ""
        if(foodLevel > 0){
            if(happiness < maxHappiness){
                happiness += 1
            }
            foodLevel -= 1
            totalPlay += 1
            levelUp()
        }
    }
    
    func feed(){
//        print(foodLevel)
        stdout = ""
        totalFeed += 1
        if(foodLevel < maxFood){
            foodLevel += 1
            levelUp()
        }
    }
    
    func levelUp(){
        stdout = ""
        if(happiness == maxHappiness && foodLevel == maxFood && level < MaxLevel){
            stdout = "Level up!"
            level += 1
            maxFood += 5
            maxHappiness += 5
        }
    }
}


