//
//  ViewController.swift
//  searchDataFromTableViewCell
//
//  Created by volive solutions on 29/08/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    struct DataModel{
        var FirstName:String = ""
        var lastName :String = ""
    }
    var arrData = [DataModel]()
    let serchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        dataModelSetup()
        serchControllerSetup()
        
    }

    
    private func dataModelSetup(){
    arrData = [DataModel(FirstName: "Harish", lastName: "Kumar"),
               DataModel(FirstName: "Srikanth", lastName: "Reddy"),
        DataModel(FirstName: "Mahesh", lastName: "Patel"),
        DataModel(FirstName: "Thirumalesh", lastName: "Nella"),
        DataModel(FirstName: "Laxman", lastName: "Methuku"),
        DataModel(FirstName: "Ravi Teja", lastName: "Patha"),]
     
    }
    
    private func serchControllerSetup(){
        
        serchController.searchResultsUpdater = self
       
        serchController.searchBar.delegate = self
        
        navigationItem.searchController = serchController
    }

}

    

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrData[indexPath.row].FirstName
        cell.detailTextLabel?.text = arrData[indexPath.row].lastName
        return cell
    }
}

extension ViewController:UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let serchText = searchController.searchBar.text else{ return}
        
        if serchText == "" {
            
            dataModelSetup()
        }else{
            
            arrData = arrData.filter{
                $0.FirstName.contains(serchText)
            }
        }
        
        tableView .reloadData()
    }
    
}
