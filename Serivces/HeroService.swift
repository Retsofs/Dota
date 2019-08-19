//
//  HeroService.swift
//  Dota
//
//  Created by Макаров Иван on 19/08/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

class HeroService {
    private let networkLayer = NetworkLayer()
    
    func getList(completionHandler: (([Hero], Error?) -> Void)?) {
        let url = URLList.heroes
        networkLayer.GET(url: url) { (data, error) in
            var models = [Hero]()
            if let data = data {
                do {
                    models = try JSONDecoder().decode([Hero].self, from: data)
                }catch let serrializationError {
                    completionHandler?(models, serrializationError)
                    return
                }
            }
            
            completionHandler?(models, error)
        }
        
    }
}
