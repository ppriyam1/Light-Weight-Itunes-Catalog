//
//  ItunesTableViewController.swift
//  ItnuesAPI
//
//  Created by Preeti Priyam on 3/30/21.
//

import UIKit

class ItunesTableViewController: UITableViewController {
    
    var textLabel = ""
    
    var ituneApiData: ItuneAPIData? = nil
    var apiManager = ApiManager()
    
    var favorites = Favorites()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell.getNib(), forCellReuseIdentifier: cell.identifier)
        apiManager.createApiURL(textLabel) { [weak self] (result) in
            if let result = result {
                self?.ituneApiData = result
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(textLabel)
        return ituneApiData?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: cell.identifier) as! cell
        customCell.title.text = ituneApiData?.results[indexPath.row].trackName
        customCell.kind.text = ituneApiData?.results[indexPath.row].kind.rawValue
        return customCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        if cell?.accessoryType == .checkmark{
            favorites.deleteFavourite(
                trackName: (ituneApiData?.results[indexPath.row].trackName)!,
                kind: (ituneApiData?.results[indexPath.row].kind.rawValue)!)
            cell?.accessoryType = .none
        }else{
            favorites.addFavorite(
                trackName: (ituneApiData?.results[indexPath.row].trackName)!,
                kind: (ituneApiData?.results[indexPath.row].kind.rawValue)!)
            cell?.accessoryType = .checkmark
        }
        
        
        
        
    }
}
