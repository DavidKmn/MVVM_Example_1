//
//  CurrencyCell.swift
//  MVVM(Example)
//
//  Created by David on 18/08/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    var currencyRate: CurrencyRate? {
        didSet {
            if let newValue = currencyRate {
                print("Rate is set!!!")
                isoLabel.text = newValue.currencyIso
            }
        }
    }
    
    let isoLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        addSubview(isoLabel)
        
        isoLabel.translatesAutoresizingMaskIntoConstraints = false
        isoLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        isoLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        isoLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        isoLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension UITableViewCell {
    class var reuseId: String {
        return String(describing: self)
    }
}
