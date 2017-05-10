//
//  ViewController.swift
//  randomuser
//
//  Created by Stephen Muscarella on 5/9/17.
//  Copyright © 2017 samuscarella. All rights reserved.
//

import UIKit
import Alamofire

class PeopleVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    var people = [Person]()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = LogoView()
                
        tableView.delegate = self
        tableView.dataSource = self
        
        getPeople()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! PeopleCell
        self.person = cell.person
        performSegue(withIdentifier: "DetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if people.count > 0 {
            
            let person = people[(indexPath as NSIndexPath).row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath) as! PeopleCell
            
            var avatarThumbnail: UIImage?
            
            if let thumbnailUrl = person.thumbnailAvatar {
                avatarThumbnail = self.imageCache.object(forKey: thumbnailUrl as AnyObject) as? UIImage
            }
            
            cell.configureCell(person: person, avatarThumbnail: avatarThumbnail)
            
            return cell
        }
        return PeopleCell()
    }
    
    func getPeople() {
        
        let url = URL(string: "https://randomuser.me/api/?results=100")!
        Alamofire.request(url).responseJSON { res in
            
            print(res)
            
            guard let response = res.value as? NSDictionary else {
                //if time throw error and handle
                return
            }
            
            if let people = response.value(forKey: "results") as? [[String:Any]] {
                
                for p in people {
                    
                    let person = Person(dictionary: p as NSDictionary)
                    self.people.append(person)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailVC" {
            
            let detailVC = segue.destination as! DetailVC
            detailVC.person = self.person
        }
    }
}
