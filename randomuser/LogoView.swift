//
//  LogoView.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/9/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit

class LogoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let logo = UIImage(named: "question-mark")
        let imageView = UIImageView(image: logo)
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(imageView)
        self.clipsToBounds = true
        
        imageView.center = (imageView.superview?.center)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
