//
//  HomeScreen.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/14/20.
//

import UIKit

class HomeScreen: UITableViewController {
    var searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: K.background))
        navigationItem.titleView = searchController.searchBar
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
