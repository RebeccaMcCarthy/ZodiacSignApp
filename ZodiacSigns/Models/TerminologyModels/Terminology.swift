//
//  Terminology.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class Terminology {
    //class data
    var termData : [Item]
    
    init() {
        //class init
        termData =
        [
            Item(name:"name", description:"desc"),
            Item(name:"name1", description:"desc1"),
            Item(name:"name2", description:"desc2"),
        ]
    }
    
    init(xmlFileName: String) {
        
        // make a XMLPeopleParser
        let parser = XMLTerminologyParser(fileName: xmlFileName)
        // parsing
        parser.parsing()
        
        // set peopleData with what it comes from parsing
        termData = parser.terminology
    }
    
    //class methods
    func getCount()->Int{return termData.count}
    func getItem(index:Int)->Item{return termData[index]}
}
