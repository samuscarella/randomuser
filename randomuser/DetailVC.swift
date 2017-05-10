//
//  DetailVC.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/10/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit
import Alamofire

class DetailVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var nameView: UIView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = LogoView()
        updateUI()
    }
    
    func updateUI() {
        
        if let firstName = person.firstName, let lastName = person.lastName {
            fullNameLbl.text = firstName.capitalized + " " + lastName.capitalized
        } else {
            fullNameLbl.text = "Anonymous"
        }
        
        if let largeAvatarUrl = person.largeAvatar {
            
            let url = URL(string: largeAvatarUrl)!
            Alamofire.request(url).responseData { res in
                
                if let bytes = res.value {
                    self.avatarImageView.image = UIImage(data: bytes)
                } else {
                    self.avatarImageView.image = UIImage(named: "user")
                }
            }
        } else {
            avatarImageView.image = UIImage(named: "user")
        }
        
        if let flag = person.country {
            flagImageView.image = UIImage(named: flag)
        }
        
        if person.gender == "male" {
            genderImageView.image = UIImage(named: "male")
        } else if person.gender == "female" {
            genderImageView.image = UIImage(named: "female")
        }
        setCustomUIProperties()
    }
    
    func setCustomUIProperties() {
        
        nameView.dropShadow()
        countryView.dropShadow()
        genderView.dropShadow()

        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height / 2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.clipsToBounds = true
        
        
        //subclass this
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: 100.0).cgPath
    }
}

extension UIView {
    
    func dropShadow() {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
