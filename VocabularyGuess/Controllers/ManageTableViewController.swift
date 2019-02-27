//
//  ManageTableViewController.swift
//  VocabularyGuess
//
//  Created by Clovis Magenta da Cunha on 19/02/19.
//  Copyright © 2019 CMC. All rights reserved.
//

import UIKit
import RealmSwift

class ManageTableViewController: UITableViewController {

    private var allTranslations : Results<Translations>?
    private let myRealm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadTranslations()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allTranslations?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = allTranslations?[indexPath.row].english
        
        return cell
    }
    
    func loadTranslations() {
    
        do {
            try myRealm.write {
                allTranslations = myRealm.objects(Translations.self)
            }
        } catch {
            print("Error during get operation of all Translations")
        }
    }
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
}
