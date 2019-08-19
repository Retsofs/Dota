//
//  HeroListViewController.swift
//  Dota
//
//  Created by Макаров Иван on 19/08/2019.
//  Copyright © 2019 123. All rights reserved.
//

import UIKit

protocol HeroListViewProtocol: class {
    func showLoading()
    func updateView()
    func showError(message: String)
}


class HeroListViewController: UIViewController, HeroListViewProtocol {
    @IBOutlet private weak var actvityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    private var presenter: HeroListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Heroes"
        
        presenter = HeroListPresenter(with: self)
        presenter?.updateData()
        
    }
    
    func showLoading() {
        actvityIndicator.startAnimating()
    }
    
    func updateView() {
        actvityIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    func showError(message: String) {
        actvityIndicator.stopAnimating()
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

extension HeroListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroItemCell", for: indexPath)
        let hero = presenter?.itemAtIndex(index: indexPath.row)
        cell.textLabel?.text = hero?.name
        return cell
    }
    
}
