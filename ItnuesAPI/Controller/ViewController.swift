//
//  ViewController.swift
//  ItnuesAPI
//
//  Created by Preeti Priyam on 3/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    @IBOutlet weak var searchTextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextLabel.delegate = self
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        favoritesTableView.register(cell.getNib(), forCellReuseIdentifier: cell.identifier)
        
    }
    
    //To reaload data on View Controller Table View
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        favoritesTableView.reloadData()
    }

}

//MARK: - UITableViewDelegate UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Favorites.favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: cell.identifier) as! cell
        customCell.title.text = Favorites.favoriteItems[indexPath.row].trackName
        customCell.kind.text = Favorites.favoriteItems[indexPath.row].kind
        return customCell
    }
}

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextLabel.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextLabel.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextLabel.text != ""{
            return true
        }else{
            searchTextLabel.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        performSegue(withIdentifier: "homeToTableView", sender: self)
        searchTextLabel.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ItunesTableViewController{
            if let query = searchTextLabel.text {
                destinationVC.textLabel = query
            }
        }
    }
    
    
}

