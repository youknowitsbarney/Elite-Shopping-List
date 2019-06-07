//
//  MyListsViewController.swift
//  Elite Shopping List
//
//  Created by Barney on 06/06/2019.
//  Copyright © 2019 Barney Corp. All rights reserved.
//

import UIKit

class MyListsViewController: UITableViewController {
    
    let items = ["House Shopping": ["Soap", "Batteries", "Milk", "Juice", "Bleach", "New Sheets"],
                 "Personal Shopping": ["Screen Guard", "Toothbrush", "Tees", "Socks", "Toothpaste" ],
                 "Vacay Shopping":["Sunglasses", "Bikini", "Beach Ball", "Slippers", "Hat", "Suitcase"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listID", for: indexPath)
        let categories = Array(items.keys)
        cell.textLabel?.text = categories[indexPath.row]
        
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ListContentsViewController {
            
            let indexPath = tableView.indexPathForSelectedRow
            let category = Array(items.keys)[indexPath?.row ?? 0]
            let categoryItems = items[category]

            destination.data = categoryItems
        }
    }

}

