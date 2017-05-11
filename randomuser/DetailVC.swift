//
//  DetailVC.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/10/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit
import Alamofire
import MapKit

class DetailVC: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var genderImageView: UIImageView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let geocoder = CLGeocoder()
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = LogoView()

        mapView.delegate = self
        
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
        
        if let phone = person.phone {
            phoneLbl.text = phone
        }
        
        if person.gender == "male" {
            genderImageView.image = UIImage(named: "male")
        } else if person.gender == "female" {
            genderImageView.image = UIImage(named: "female")
        }
        
        if let street = person.street, let city = person.city, let country = person.country {
            
            let fullAddress = country + ", " + city + ", " + street
            print(fullAddress)
            geocoder.geocodeAddressString(fullAddress) { placemarks, error in
                
                if let placemark = placemarks?[0] {
                    
                    if let pmCircularRegion = placemark.region as? CLCircularRegion {
                        
                        let metersAcross = pmCircularRegion.radius * 2
                        let region = MKCoordinateRegionMakeWithDistance(pmCircularRegion.center, metersAcross, metersAcross)
                        let adjustedRegion = self.mapView.regionThatFits(region)
                        
                        self.mapView.setRegion(adjustedRegion, animated: true)
                        self.mapView.showsUserLocation = true
                    }
                }
            }
        }
        setCustomUIProperties()
    }
    
    func setCustomUIProperties() {
        
        nameView.dropShadow()
        countryView.dropShadow()
        genderView.dropShadow()
        phoneView.dropShadow()
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
