//
//  DetailLayerView.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/10/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit

class DetailLayerView: UIView {

    override func awakeFromNib() {
        
        layer.shadowColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
