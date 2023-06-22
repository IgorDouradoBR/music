//
//  TableViewController.swift
//  Music
//
//  Created by Lucas Cunha on 20/06/23.
//

import UIKit

class TableViewControllerLibrary: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let categories = MusicCollectionType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //1 - retrieve cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell", for: indexPath) as? LibraryTableViewCell else { return UITableViewCell() }

        //2 - configure cell
        //old configuration
        let cat = categories[indexPath.row]

        cell.category = cat
        cell.configure(category: cat)

        //3 - return cell
        return cell
    }
}

