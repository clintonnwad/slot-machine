//
//  SlotColumn.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//
//  GROUP NUMBER: 20
//  NAMES:
//  Clinton Nwadiukor  - 301291242
//  Jovi Chen-Mcintyre - 301125059
//
//  DESCRIPTION:
//  Slot Machine application for iOS. Users can place bets, spin and either win or lose
//
//  REVISION HISTORY:
//  https://github.com/clintonnwad/slot-machine/commits/main
//
//  DATE LAST MODIFIED:
//  January 22, 2022

import CoreFoundation


class SlotColumn{
    
    //use to clipp image from view when not in slot machine display
    var upperBoundCutOff:CGFloat = 200
    var lowerBoundCutOff:CGFloat = -200
    var resetCutOffPoint:CGFloat = -10000
    var restPoint:CGFloat = 10000
    
    var isSpinning = false
    
    //current speed
    var verticalSpeed:CGFloat = 0
    //max speed wheels can go
    var vertialMaxSpeed:CGFloat = 20
    
    var items:[SlotItem] = []
    
    init() {
        //load different slot items
        items.append(SlotItem(itemName: "cherry"))
        items.append(SlotItem(itemName: "seven"))
        items.append(SlotItem(itemName: "melon"))
        items.append(SlotItem(itemName: "bell"))
        items.append(SlotItem(itemName: "strawberry"))
        items.append(SlotItem(itemName: "grape"))
        items.append(SlotItem(itemName: "orange"))
        items.append(SlotItem(itemName: "strawberry"))
        items.append(SlotItem(itemName: "melon"))
        items.append(SlotItem(itemName: "lemon"))
        items.append(SlotItem(itemName: "somefruitidk"))

    }
    
    func update(){
        
        //use to simulate acceleration
        if(verticalSpeed < vertialMaxSpeed && isSpinning){
            verticalSpeed = verticalSpeed + 1
        }
    
        var index = 0
        for item in items{
            
            //this check is use to make sprite invisible when the pass a certain point on screen
            if(item.position.y < lowerBoundCutOff || item.position.y > upperBoundCutOff)
            {
                item.isHidden = true
            }
            else{
                item.isHidden = false
            }
            item.position.y = item.position.y - verticalSpeed
            
        
            //reset slot item if there pass a certain point so well looks continious
            if(item.position.y < resetCutOffPoint){
                item.position.y = restPoint
            }
            index = index + 1
        }
    }
    

}
