//
//  PeopleCell.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/9/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit
import Alamofire

class PeopleCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var genderDotView: UIView!
    
    var person: Person!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configureCell(person: Person, avatarThumbnail: UIImage?) {
        
        self.person = person
        
        if let firstName = person.firstName, let lastName = person.lastName {
            nameLbl.text = firstName.capitalized + " " + lastName.capitalized
        } else {
            nameLbl.text = "Anonymous"
        }
        
        if let gender = person.gender {
            genderLbl.text = gender.capitalized
            
            if gender == "male" {
                self.genderDotView.backgroundColor = UIColor(red: 80.0 / 255.0, green: 200.0 / 255.0, blue: 239.0 / 255.0, alpha: 1)
            } else if gender == "female" {
                self.genderDotView.backgroundColor = UIColor(red: 255.0, green: 192.0 / 255.0, blue: 203.0 / 255.0, alpha: 1)
            }
        }
        
        if let flag = person.country {
            flagImageView.image = UIImage(named: flag)
        }
        
        if avatarThumbnail != nil {
            avatarImageView.image = avatarThumbnail
        } else if let urlString = person.thumbnailAvatar {

            let url = URL(string: urlString)!
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
        
        
        
        
        
        setCustomViewProperties()
    }
    
    func setCustomViewProperties() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.clipsToBounds = true
        genderDotView.layer.cornerRadius = genderDotView.frame.size.height / 2
    }
}
