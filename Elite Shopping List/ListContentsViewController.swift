//
//  ListContentsViewController.swift
//  Elite Shopping List
//
//  Created by Barney on 07/06/2019.
//  Copyright © 2019 Barney Corp. All rights reserved.
//

import UIKit

class ListContentsViewController: UIViewController {

    var data: [String]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        view.bringSubviewToFront(menuView)

    }
    
    @IBAction func addItem(_ sender: Any) {
        
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
        
        data?.append(text)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.menuView.transform = .identity
            
        }
        
        tableView.reloadData()
    }
}

extension ListContentsViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemID", for: indexPath)
        
        cell.textLabel?.text = data?[indexPath.row]
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
