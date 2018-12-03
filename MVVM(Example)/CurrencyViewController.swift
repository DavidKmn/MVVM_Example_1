//
//  ViewController.swift
//  MVVM(Example)
//
//  Created by David on 18/08/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.reuseId)
        return tableView
    }()
    
    let dataSource = CurrencyDataSource()

    lazy var viewModel : CurrencyViewModel = { [unowned self] in
        let viewModel = CurrencyViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        title = "£ Exchange Rates"
        
        dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchCurrencies()
    }
}



