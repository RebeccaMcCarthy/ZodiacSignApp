//
//  signs.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class Sign{
    //attributes
    var name             :   String
    var dateRange        :   String
    var symbol           :   String
    var element          :   String
    var polarity         :   String
    var modality         :   String
    var planet           :   String
    var image            :   String
    var imageMain        :   String
    var sunInfo          :   String
    var moonInfo         :   String
    var ascendingInfo    :   String
    var webLink          :   String
    
    //init-s
    init(){
        self.name            = "John Doe"
        self.dateRange       = "None"
        self.symbol          = "None"
        self.element         = "None"
        self.polarity        = "None"
        self.modality        = "None"
        self.planet          = "None"
        self.image           = "None"
        self.imageMain       = "None"
        self.sunInfo         = "None"
        self.moonInfo        = "None"
        self.ascendingInfo   = "None"
        self.webLink         = "None"
    }
        
    init(name:String, dateRange:String, symbol:String, element:String, polarity:String,
         modality:String, planet:String, image:String, imageMain:String,
         sunInfo:String, moonInfo:String, ascendingInfo:String, webLink:String){
        self.name            = name
        self.dateRange       = dateRange
        self.symbol          = symbol
        self.element         = element
        self.polarity        = polarity
        self.modality        = modality
        self.planet          = planet
        self.image           = image
        self.imageMain       = imageMain
        self.sunInfo         = sunInfo
        self.moonInfo        = moonInfo
        self.ascendingInfo   = ascendingInfo
        self.webLink         = webLink
    }
}
