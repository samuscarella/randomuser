//
//  Person.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/9/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import Foundation

class Person {
    
    private var _firstName: String?
    private var _lastName: String?
    private var _gender: String?
    private var _country: String?
    private var _thumbnailAvatar: String?
    private var _largeAvatar: String?
    private var _phone: String?
    private var _street: String?
    private var _city: String?
    private var _state: String?
    private var _postcode: Int?
    
    var firstName: String? {
        return _firstName
    }
    
    var lastName: String? {
        return _lastName
    }
    
    var gender: String? {
        return _gender
    }
    
    var country: String? {
        return _country
    }
    
    var phone: String? {
        return _phone
    }
    
    var thumbnailAvatar: String? {
        return _thumbnailAvatar
    }
        
    var largeAvatar: String? {
        return _largeAvatar
    }
    
    var street: String? {
        return _street
    }
    
    var city: String? {
        return _city
    }
    
    var state: String? {
        return _state
    }
    
    var postcode: Int? {
        return _postcode
    }
    
    init(dictionary: NSDictionary) {
                
        if let firstName = dictionary.value(forKeyPath: "name.first") as? String {
            self._firstName = firstName
        }
        
        if let lastName = dictionary.value(forKeyPath: "name.last") as? String {
            self._lastName = lastName
        }
        
        if let gender = dictionary.value(forKey: "gender") as? String {
            self._gender = gender
        }
        
        if let country = dictionary.value(forKey: "nat") as? String {
            self._country = country
        }
        
        if let phone = dictionary.value(forKey: "phone") as? String {
            self._phone = phone
        }
        
        if let street = dictionary.value(forKeyPath: "location.street") as? String {
            self._street = street
        }
        
        if let city = dictionary.value(forKeyPath: "location.city") as? String {
            self._city = city
        }
        
        if let state = dictionary.value(forKeyPath: "location.state") as? String {
            self._state = state
        }
        
        if let postcode = dictionary.value(forKeyPath: "location.postcode") as? Int {
            self._postcode = postcode
        }
        
        if let thumbnail = dictionary.value(forKeyPath: "picture.thumbnail") as? String {
            self._thumbnailAvatar = thumbnail
        }
        
        if let largeAvatar = dictionary.value(forKeyPath: "picture.large") as? String {
            self._largeAvatar = largeAvatar
        }
    }
}
