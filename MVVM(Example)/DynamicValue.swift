//
//  DynamicValue.swift
//  MVVM(Example)
//
//  Created by David on 18/08/2018.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation
typealias CompletionHandler = (() -> Void)

class DynamicValue<T> {
    
    var value: T {
        didSet { notifyObservers() }
    }
    
    private var observers = [String : CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func add(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
        self.notifyObservers()
    }
    
    private func notifyObservers() {
        observers.forEach { $0.value() }
    }
    
    deinit {
        observers.removeAll()
    }
}
