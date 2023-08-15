//
//  Item.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class Item {
    //attributes
    var name : String
    var description : String
    
    //init-s
    init(){
        self.name            = "John Doe"
        self.description     = "None"
    }
    
    init(name:String, description:String) {
        self.name            = name
        self.description     = description
    }
}
