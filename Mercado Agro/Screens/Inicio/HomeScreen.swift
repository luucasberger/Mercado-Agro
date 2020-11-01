//
//  HomeScreen.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/23/20.
//

import UIKit

class HomeScreen: UIViewController {
    var searchController = UISearchController()
    var models = [ModelP]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        models.append(ModelP(text: "Gallina", imageName: "GallinaImage", price: "US$ 19.99"))
        models.append(ModelP(text: "Vaca", imageName: "VacaImage", price: "US$ 300.00"))
        models.append(ModelP(text: "Cerdo", imageName: "CerdoImage", price: "US$ 99.99"))
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: K.background))
        
        customizedNavigationController()
        customizedSearchBar()
        customizedTableView()
        
        ////////////////////////////////////////////////////////////////////////
        
        
        
    }
    
    func customizedNavigationController() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: K.navigationBackground), for: UIBarMetrics.default)
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        
    }
    
    func customizedSearchBar() {
        let searchBar = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchBar.showsScopeBar = false
        searchBar.showsBookmarkButton = false
        searchBar.showsSearchResultsButton = false
        
        searchBar.placeholder = "Buscar en Mercado Agro"
        searchBar.tintColor = .black
        
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            textfield.layer.cornerRadius = 15.0
            textfield.font = UIFont.systemFont(ofSize: CGFloat(13))
            textfield.layer.masksToBounds = true
        }        
    }
    
    func customizedTableView() {
        tableView.separatorStyle = .none
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDelegate

extension HomeScreen: UITableViewDelegate {
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    */

}

// MARK: - UITableViewDataSource

extension HomeScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

// MARK: - UISearchControllerDelegate

extension HomeScreen: UISearchControllerDelegate {
    
}

// MARK: - UISearchBarDelegate

extension HomeScreen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.text = ""
        searchController.resignFirstResponder()
    }
}

// MARK: - UISearchResultsUpdating

extension HomeScreen: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
