//
//  HomeScreen.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/23/20.
//

import UIKit

class HomeScreen: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        tableView.delegate = self
        
        tableView.backgroundView = UIImageView(image: UIImage(named: K.background))
        
        setupNavigationController()
        setupUITextField()
        setupTableView()
        
        /////////////
        
        
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: K.navigationBackground), for: UIBarMetrics.default)
    }
    
    func setupUITextField() {
        textField.placeholder = "Buscar en Mercado Agro"
        
        textField.layer.cornerRadius = 15.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.white.cgColor
        
        textField.clearButtonMode = .whileEditing
        
        let overlayButton = UIButton(type: .custom)
        overlayButton.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        overlayButton.addTarget(self, action: #selector(textFieldShouldEndEditing(_:)), for: .touchUpInside)
        overlayButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        textField.leftView = overlayButton
        textField.leftViewMode = .always
        
    }
    
    func setupTableView() {
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

// MARK: - UITextFieldDelegate

extension HomeScreen: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
     }
    
}

// MARK: - UITableViewDelegate

extension HomeScreen: UITableViewDelegate {
    /*
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    */

}


// MARK: - UITableViewDataSource

extension HomeScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        return cell
    }
    
    
}
