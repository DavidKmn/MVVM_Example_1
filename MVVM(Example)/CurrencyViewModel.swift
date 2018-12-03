//
//  CurrencyViewModel.swift
//  MVVM(Example)
//
//  Created by David on 18/08/2018.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(value: T)
    case failure(errorMessage: String)
}

final class CurrencyService {
    
    static let shared = CurrencyService()
    private init() {}
    
    func fetchCurrencies(competion: @escaping (Result<Converter>) -> Void) {
       
        competion(Result.success(value: Converter(base: "Base", date: "02/12/31", rates: [CurrencyRate(currencyIso: "123", rate: 1), CurrencyRate(currencyIso: "234", rate: 2), CurrencyRate(currencyIso: "345", rate: 3), CurrencyRate(currencyIso: "456", rate: 4)])))
        
    }
}

struct CurrencyViewModel {
    
    weak var dataSource: GenericDataSource<CurrencyRate>?
    
    init(dataSource: GenericDataSource<CurrencyRate>?) {
        self.dataSource = dataSource
    }
    
    func fetchCurrencies() {
        CurrencyService.shared.fetchCurrencies { (result) in
            switch result {
            case .success(value: let converter):
                self.dataSource?.data.value = converter.rates
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}


