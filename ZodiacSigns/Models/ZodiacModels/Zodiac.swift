//
//  zodiac.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class Zodiac{
    //class data
    var zodiacData : [Sign]
    
    //class init
    init(){
        zodiacData =
        [
            Sign(name: "Aries", dateRange: "March 21 - April 19", symbol: "Ram", element: "Fire",
                 polarity: "Masculine", modality:"Cardinal", planet:"Mars", image: "aries.png",
                 imageMain: "ariesMain.png", sunInfo: "additional text here", moonInfo: "moon",
                 ascendingInfo:"rising", webLink:"https://www.google.com"),
            Sign(name: "Taurus", dateRange: "April 20 - May 20", symbol: "Bull", element: "Earth",
                 polarity: "Feminine", modality:"Fixed", planet:"Venus", image: "taurus.png",
                 imageMain: "taurusMain.png", sunInfo: "additional text here", moonInfo: "moon",
                 ascendingInfo:"rising",webLink:"https://www.google.com"),
            Sign(name: "Gemini", dateRange: "Mary 21 - June 20", symbol: "Twins", element: "Air",
                 polarity: "Masculine", modality:"Mutable", planet:"Mercury", image: "gemini.png",
                 imageMain: "geminiMain.png", sunInfo: "additional text here", moonInfo: "moon",
                 ascendingInfo:"rising", webLink:"https://www.google.com"),
        ]
    }
    
    init(xmlFileName: String) {
        
        // make a XMLPeopleParser
        let parser = XMLZodiacParser(fileName: xmlFileName)
        // parsing
        parser.parsing()
        
        // set peopleData with what it comes from parsing
        zodiacData = parser.zodiac
    }
    
    //class methods
    func getCount()->Int{return zodiacData.count}
    func getSign(index:Int)->Sign{return zodiacData[index]}
    
}


