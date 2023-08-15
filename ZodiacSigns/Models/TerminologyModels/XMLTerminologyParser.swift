//
//  XMLTerminologyParser.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class XMLTerminologyParser: NSObject, XMLParserDelegate {
    var fileName: String
    init(fileName:String){self.fileName = fileName}
    
    // vars to hold tag data
    var pName, pDescription: String!
    
    // vars to spy during parsing
    var elementID = -1
    var passData = false
    
    //vars to manage whole data
    var item = Item()
    var terminology = [Item]()
    
    var parser = XMLParser()
    
    var tags = ["name", "description"]
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
       
        // if elementName is in tags then spy
        if(tags.contains(elementName)){
            passData = true
            switch (elementName) {
                case "name"         : elementID = 0
                case "description"    : elementID = 1
                
                default : break;
            }
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // based on the spies grab some data into PVars
        if passData {
            switch elementID {
                case 0      : pName          = string
                case 1      : pDescription     = string
                
                default     : break;
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
       
        // reset the spys
        if tags.contains(elementName){
            passData = false
            elementID = -1
        }
        
        // if elementName is sign then make a sign and amend to zodiacs
        if elementName == "item" {
            item = Item(name: pName, description: pDescription)
            terminology.append(item)
        }
    }
    
    func parsing(){
       
        // get the path of the xml file
        let bundleUrl = Bundle.main.bundleURL
        let fileUrl = URL(string: self.fileName, relativeTo: bundleUrl)
        
        // make the parser for this file
        parser = XMLParser(contentsOf: fileUrl!)!
        
        // give the deleagate and parse
        parser.delegate = self
        parser.parse()
    }
}
