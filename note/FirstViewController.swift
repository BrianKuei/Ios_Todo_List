//
//  FirstViewController.swift
//  note
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource,UITabBarDelegate {
    
    var items: [String] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemObj = UserDefaults.standard.object(forKey: "userEntry")
        if let tempItem = itemObj as? [String] {
            items = tempItem
            tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 6
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObj = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        //cellObj.textLabel?.text = "test"
        
        cellObj.textLabel?.text = items[indexPath.row]
        
        return cellObj
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            items.remove(at: indexPath.row)
            tableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "userEntry")
        }
    }
}

