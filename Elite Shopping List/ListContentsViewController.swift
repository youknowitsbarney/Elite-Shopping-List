//
//  ListContentsViewController.swift
//  Elite Shopping List
//
//  Created by Barney on 07/06/2019.
//  Copyright © 2019 Barney Corp. All rights reserved.
//

import UIKit

class ListContentsViewController: UITableViewController {

    var data: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemID", for: indexPath)
        
        cell.textLabel?.text = data?[indexPath.row]
        
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
}
