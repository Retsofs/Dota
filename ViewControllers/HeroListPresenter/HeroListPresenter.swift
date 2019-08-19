//
//  HeroListPresenter.swift
//  Dota
//
//  Created by Макаров Иван on 19/08/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation

class HeroListPresenter {
    private weak var view: HeroListViewProtocol?
    private var models: [Hero] = [Hero]()
    private let service = HeroService()
    
    init(with view: HeroListViewProtocol) {
        self.view = view
    }
    
    func updateData() {
        view?.showLoading()
        service.getList { (models, error) in
            DispatchQueue.main.async {
                self.models = models
                
                if let error = error {
                    self.view?.showError(message: error.localizedDescription)
                }
                
                self.view?.updateView()
            }            
        }
    }
    
    func numberOfItems() -> Int {
        return models.count
    }
    
    func itemAtIndex(index: Int) -> Hero {
        return models[index]
    }
}
