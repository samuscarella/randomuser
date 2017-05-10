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
    
    var thumbnailAvatar: String? {
        return _thumbnailAvatar
    }
        
    var largeAvatar: String? {
        return _largeAvatar
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
        
        if let thumbnail = dictionary.value(forKeyPath: "picture.thumbnail") as? String {
            self._thumbnailAvatar = thumbnail
        }
        
        if let largeAvatar = dictionary.value(forKeyPath: "picture.large") as? String {
            self._largeAvatar = largeAvatar
        }
    }
}
