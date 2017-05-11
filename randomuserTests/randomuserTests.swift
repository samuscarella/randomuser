//
//  randomuserTests.swift
//  randomuserTests
//
//  Created by Stephen Muscarella on 5/9/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import XCTest
import Alamofire
@testable import randomuser

class randomuserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let url = URL(string: "https://randomuser.me/api/?results=100")!
        Alamofire.request(url).responseJSON { res in
            
            let people = response.value(forKey: "results") as? [[String:Any]]
            assert(people.count == 100)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
