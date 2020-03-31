//
//  ViewController.swift
//  CoreData+TableView
//
//  Created by Luiza Fattori on 30/03/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var shoppingItens: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.register(UITableViewCell.self,
                            forCellReuseIdentifier: "Cell")
    }

    // MARK: Button + at the top
    @IBAction func addItem(_ sender: Any) {
        // This is the modal that will apear on the screen to imput a new meal
        let alert = UIAlertController.init(title: "Add",
                                           message: "Add here a new meal",
                                           preferredStyle: .alert)
        // To save the meal
        let saveAction = UIAlertAction.init(title: "Save",
                                          style: .default) {

            [unowned self] action in

            guard let textField = alert.textFields?.first,
              let itemToSave = textField.text else {
                return
            }
            // To add the meal to the array
            self.shoppingItens.append(itemToSave)
            self.tableView.reloadData()

            }
        // The button that will appear to cancel the adding
        let cancelAction = UIAlertAction.init(title: "Cancel",
                                              style: .cancel)
        alert.addTextField()

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItens.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shoppingItens[indexPath.row]

    return cell

    }

}

