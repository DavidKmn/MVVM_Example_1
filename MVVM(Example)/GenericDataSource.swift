//
//  GenericDataSource.swift
//  MVVM(Example)
//
//  Created by David on 18/08/2018.
//  Copyright © 2018 David. All rights reserved.
//

import Foundation

class GenericDataSource<T>: NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
