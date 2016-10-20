//
//  Survey.swift
//  Survey
//
//  Created by Martin Kirke on 10/20/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

struct Survey {
    
    let identifier: UUID
    let name: String
    let language: String
    
    var endpoint: URL? {
        
    }
    
    // initializer
    
    
    init(identifier: UUID = UUID(), name: String, language: String) {
    
    self.identifier = identifier
    self.name = name
    self.language = language
    }
    
}


//JSON conversion support


extension Survey {
   
    //properties
    
private static let kName = "name"
private static let kLanguage = "language"
    // provide a dictionary representation of this survey instance
    var jsonValue: [String : Any] {
        
        return [Survey.kName: self.name, Survey.kLanguage: self.language]
    }
    // provide a json representation of a dictionary represtation of this survey instance
    var jsonData: Data? {
        
        return try? JSONSerialization.data(withJSONObject: jsonValue, options: .prettyPrinted)
    }
    
    
    init?(identifier: String, dictionary: [String : Any]) {
        
        // converting form a dictionary into an instance of survey
        
        guard let name = dictionary[Survey.kName] as? String,
              let identifier = UUID(uuidString: identifier),
              let language = dictionary[Survey.kLanguage] as? String else { return nil }
        
        
//        self.init(identifier: identifier, name: name, language: language) does the same thing
        self.identifier = identifier
        self.name = name
        self.language = language
    }
    
}
