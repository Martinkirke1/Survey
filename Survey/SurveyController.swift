//
//  SurveyController.swift
//  Survey
//
//  Created by Martin Kirke on 10/20/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import Foundation

class SurveyController {
    
    
    static let baseURL = URL(string: "https://survey-api.firebaseio.com/api/survey")
    
    static let getAllSurverysEndpoint = baseURL?.appendingPathComponent("json")
    
    //methods
    
    static func putSurveyIntoApi(withName name: String, andLanguage language: String) {
        
        
        // create an instance
        
        let survey = Survey(name: name, language: language)
        
        
        //unwrap our url
        
        guard let Putendpoint = survey.Putendpoint else { return }
        
        //make the put request
        
        NetworkController.preformRequest(for: Putendpoint, httpMethod: .Put, body: survey.jsonData ) { (data, error) in
            
            let responseDataString = String(data: data!, encoding: .utf8) ?? ""
            
            if error != nil {
                
                NSLog("Error: \(error?.localizedDescription)")
                
            } else if responseDataString.contains("error") {
                
                NSLog("Error: \(error?.localizedDescription)")

            } else {
                
                NSLog("Successfully saved data to the PUT endpoint.\nResponse: \(responseDataString)")
            }
        }
    }
}

