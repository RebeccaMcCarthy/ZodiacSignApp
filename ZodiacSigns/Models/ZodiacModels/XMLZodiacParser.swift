//
//  XMLZodiacParser.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 12/03/2022.
//

import Foundation

class XMLZodiacParser : NSObject, XMLParserDelegate {
    var fileName: String
    init(fileName:String){self.fileName = fileName}
    
    // vars to hold tag data
    var pName, pDateRange, pSymbol, pElement, pPolarity, pModality, pPlanet, pImage, pImageMain,
        pSunInfo, pMoonInfo, pAscendingInfo, pWebLink: String!
    
    // vars to spy during parsing
    var elementID = -1
    var passData = false
    
    //vars to manage whole data
    var sign = Sign()
    var zodiac = [Sign]()
    
    var parser = XMLParser()
    
    var tags = ["name", "dateRange", "symbol", "element", "polarity", "modality", "planet", "image", "imageMain", "sunInfo", "moonInfo", "ascendingInfo", "webLink"]
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        // if elementName is in tags then spy
        if(tags.contains(elementName)){
            passData = true
            switch (elementName) {
                case "name"         : elementID = 0
                case "dateRange"    : elementID = 1
                case "symbol"       : elementID = 2
                case "element"      : elementID = 3
                case "polarity"     : elementID = 4
                case "modality"     : elementID = 5
                case "planet"       : elementID = 6
                case "image"        : elementID = 7
                case "imageMain"    : elementID = 8
                case "sunInfo"      : elementID = 9
                case "moonInfo"     : elementID = 10
                case "ascendingInfo": elementID = 11
                case "webLink"      : elementID = 12
                
                default         : break;
            }
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
       
        // based on the spies grab some data into PVars
        if passData {
            switch elementID {
                case 0      : pName          = string
                case 1      : pDateRange     = string
                case 2      : pSymbol        = string
                case 3      : pElement       = string
                case 4      : pPolarity      = string
                case 5      : pModality      = string
                case 6      : pPlanet        = string
                case 7      : pImage         = string
                case 8      : pImageMain     = string
                case 9      : pSunInfo       = string
                case 10     : pMoonInfo      = string
                case 11     : pAscendingInfo = string
                case 12     : pWebLink       = string

                
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
        if elementName == "sign" {
            sign = Sign(name: pName, dateRange: pDateRange, symbol: pSymbol, element: pElement,
                        polarity: pPolarity, modality: pModality, planet:pPlanet, image: pImage,
                        imageMain: pImageMain, sunInfo: pSunInfo, moonInfo: pMoonInfo,
                        ascendingInfo: pAscendingInfo, webLink: pWebLink)
            zodiac.append(sign)
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
