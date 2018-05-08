//
//  NetworkManager.swift
//  wunderground-practica
//
//  Created by George Royce on 5/5/18.
//  Copyright © 2018 George Royce. All rights reserved.
//

import Foundation


class NetworkManager {
    
    /** fetches data for a given url with the default URLSessionConfiguration and calls completion with response Data
     */
    class func fetchDataFor(url: URL, completion: @escaping (Data) -> Void) {
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error.debugDescription)
            }
            
            guard let data = data else {
                print("could not create data")
                return
            }
            
            completion(data)
            
            }.resume()
        
    }
    
}
