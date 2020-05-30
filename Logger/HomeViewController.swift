//
//  HomeViewController.swift
//  Logger
//
//  Created by Caroline Creamer on 5/17/20.
//  Copyright © 2020 Caroline Creamer. All rights reserved.
//

import UIKit
import OAuthSwift
import AeroGearOAuth2
import AeroGearHttp


class HomeViewController: UIViewController {
    
    private let http = Http(baseURL: "https://sandbox-api.dexcom.com")
    
    let rest = RestManager()
    

    @IBOutlet weak var addNewButton: UIButton!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    func getEGVS() {
        
    }

    
    let mealsArr = ["pizza", "pasta", "popcorn", "tortilla chips", "tacos", "yogurt", "strawberries", "blueberries"]
    
    var searchMeals = [String]()
    var searching = false
    
   /* private var meals = [Meal]()
    private var selectedMeal: Int?
    */
    let cellSegueIdentifier =  "CellSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == cellSegueIdentifier, let destination = segue.destination as? SelectedMealViewController, let cellIndex = tableView.indexPathForSelectedRow?.row {
            destination.selectedMealName = mealsArr[cellIndex]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear( _ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNew(_ sender: Any) {
        performSegue(withIdentifier: "addMeal", sender: self)
        
    }
    

}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchMeals.count
        } else {
           return mealsArr.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchMeals[indexPath.row]
        } else {
            cell?.textLabel?.text = mealsArr[indexPath.row]
        }
        return cell!
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMeals = mealsArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
