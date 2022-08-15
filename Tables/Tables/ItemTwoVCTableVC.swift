//
//  ItemTwoVCTableVC.swift
//  Tables
//
//  Created by Illya Gurkov on 14.08.22.
//

import UIKit

class ItemTwoVCTableVC: UITableViewController {
    let name = ["Illya", "Sergey", "Dima", "Misha", "name5"]
    let arrayEmail = ["email1@mail.ru", "email2@mail.ru", "email3@mail.ru", "email4@mail.ru", "email5@mail.ru"]
    let arraySurname = ["Surname1", "Surname2", "Surname3", "Surname4", "Surname5"]
    let arrayPhone = ["+37529-111-11-11", "+37529-111-11-12", "+37529-111-11-13", "+37529-111-11-14", "+37529-111-11-15"]

    func fullName(array1: [String], array2: [String]) -> [String] {
        var arrayResult = [String]()
        for num in 0 ... 4 {
            arrayResult.append(array1[num] + " " + array2[num])
        }
        return arrayResult
    }

    func createPerson() -> [person] {
        var array = [person]()
        let randomName = fullName(array1: name, array2: arraySurname)
        for i in 0 ..< randomName.count {
            array.append(person(fulname: randomName[i], emali: arrayPhone[i], phoneNumber: arrayEmail[i]))
        }
        return array
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nextScreen()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let acceptFullName = fullName(array1: name, array2: arraySurname)
        return acceptFullName.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let acceptFullName = fullName(array1: name, array2: arraySurname)
        cell.textLabel?.text = acceptFullName[indexPath.row]
        return cell
    }

    func nextScreen() {
        if let tabBarController = tabBarController, let second = tabBarController.viewControllers?[1] as? ItemTableVC {
            second.arrayFullName = createPerson()
        }
    }
}
