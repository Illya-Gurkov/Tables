//
//  ItemTableVC.swift
//  Tables
//
//  Created by Illya Gurkov on 14.08.22.
//

import UIKit

class ItemTableVC: UITableViewController {
    var arrayFullName: [person]?
    override func viewDidLoad() {
        super.viewDidLoad()

        clearsSelectionOnViewWillAppear = false

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        let person = arrayFullName
        // #warning Incomplete implementation, return the number of sections
        return person!.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let person = arrayFullName
            cell.textLabel?.text = person![indexPath.section].phoneNumber
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let person = arrayFullName
            cell.textLabel?.text = person![indexPath.section].emali
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let person = arrayFullName
            cell.textLabel?.text = person![indexPath.row].phoneNumber
            return cell
            // Configure the cell...
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = arrayFullName
        return person![section].fulname
    }

}
