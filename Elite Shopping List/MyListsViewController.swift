//
//  MyListsViewController.swift
//  Elite Shopping List
//
//  Created by Barney on 06/06/2019.
//  Copyright © 2019 Barney Corp. All rights reserved.
//

import UIKit

class MyListsViewController: UIViewController {
    
    var items = ["House Shopping": ["Soap", "Batteries", "Milk", "Juice", "Bleach", "New Sheets"],
                 "Personal Shopping": ["Screen Guard", "Toothbrush", "Tees", "Socks", "Toothpaste" ],
                 "Vacay Shopping":["Sunglasses", "Bikini", "Beach Ball", "Slippers", "Hat", "Suitcase"]]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addList(_ sender: Any) {
   
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = CGAffineTransform(translationX: 0, y: -500)
            
        }
        
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = .identity
            
        }
        
    }
    
    @IBAction func save(_ sender: Any)  {
        
        guard let text = textField.text else { return }
        
        items[text] = []
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = .identity
            
        }
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        menuView.layer.cornerRadius = 20
        view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        textField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        view.bringSubviewToFront(menuView)
        self.navigationItem.title = "My Lists"
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

extension MyListsViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listID", for: indexPath)
        let categories = Array(items.keys)
        cell.textLabel?.text = categories[indexPath.row]
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()

        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "showDetails", sender: self)
    }
}
