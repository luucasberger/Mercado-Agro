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
    var images = ["Ad1", "Ad2", "Ad3"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        models.append(ModelP(text: "Gallina", imageName: "GallinaImage", price: "US$ 19.99", category: "Categoría 1"))
        models.append(ModelP(text: "Vaca", imageName: "VacaImage", price: "US$ 300.00", category: "Categoría 2"))
        models.append(ModelP(text: "Cerdo", imageName: "CerdoImage", price: "US$ 99.99", category: "Categoría 3"))
        models.append(ModelP(text: "Vaca", imageName: "VacaImage", price: "US$ 45.00", category: "Categoría 4"))
        models.append(ModelP(text: "Gallina", imageName: "GallinaImage", price: "US$ 87.99", category: "Categoría 5"))
        models.append(ModelP(text: "Cerdo", imageName: "CerdoImage", price: "US$ 125.00", category: "Categoría 6"))
        
        self.tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        self.tableView.register(OffersTableViewCell.nib(), forCellReuseIdentifier: OffersTableViewCell.identifier)
                
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = #colorLiteral(red: 0.9214094883, green: 0.9214094883, blue: 0.9214094883, alpha: 1)
        
        customizedNavigationController()
        customizedSearchBar()
        customizedTableView()
        
        ////////////////////////////////////////////////////////////////////////
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let ad: OffersTableViewCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! OffersTableViewCell
//        ad.collectionView.scrollToItem(at: IndexPath(row: 500, section: 0), at: .centeredHorizontally, animated: false)
//    }
    
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
        return models.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OffersTableViewCell.identifier, for: indexPath) as! OffersTableViewCell
            cell.configure(with: images)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
            cell.configure(with: models)
            cell.categoryLabel.text = models[indexPath.row - 1].category
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
