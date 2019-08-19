//
//  NetworkLayer.swift
//  Dota
//
//  Created by Макаров Иван on 19/08/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

class NetworkLayer {
    private let session = URLSession(configuration: .default)
    
    func GET(url: String, completionHandler: ((Data?, Error?) -> Void)?) {
        guard let url = URL(string: url) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            completionHandler?(data, error)
        }
        
        dataTask.resume()
    }
}
