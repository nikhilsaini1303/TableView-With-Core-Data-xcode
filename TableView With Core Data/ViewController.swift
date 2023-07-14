//
//  ViewController.swift
//  TableView With Core Data
//
//  Created by Nikhil Saini on 18/04/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var myTable: UITableView!
    
    var country: UITextField!
    var cData = [Country_Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dh = DataBaseHandler()
        cData = dh.fetchData()
        
        myTable.reloadData()
        
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Data", message: "Enter Country Name", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            let newCountryName = self.country.text!
            let dh = DataBaseHandler()
            dh.saveData(cName: newCountryName)
            self.cData = dh.fetchData()
            self.myTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancelled the Operation")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addTextField{ (textfield) in
            self.country = textfield
            self.country.placeholder = "Enter Country Name"
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cData[indexPath.row].country_name
        
        return cell
        
    }
}

