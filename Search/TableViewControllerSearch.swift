//
//  TableViewControllerSearch.swift
//  Music
//
//  Created by Lucas Cunha on 20/06/23.
//

import UIKit

class TableViewControllerSearch: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var service = try? MusicService()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service?.loadLibrary().count ?? 0
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var musicService = try? MusicService()

    private var musicians:[MusicCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        guard let musicService = musicService else{return}
        musicians = musicService.loadLibrary()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //1 - retrieve cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }

        //2 - configure cell
        //old configuration
        let musician = musicians[indexPath.row]

        cell.musician = musician
        cell.configure(category: musician)

        //3 - return cell
        return cell
    }
}
