//
//  CharacterListViewController.swift
//  ClassDelegateTableView
//
//  Created by Marina De Pazzi on 14/06/23.
//

import UIKit

class FavoritesTableView: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
  
    var musicService: MusicService?
    
    var mus: [Music] = []
    
    
    @IBOutlet weak var favTable: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.musicService = try MusicService()
//            self.musicService?.favoriteMusics = []
            
            self.musicService!.toggleFavorite(music: musicService!.getAllMusics()[0], isFavorite: true)
            
            if let musicService = musicService {
                mus = musicService.getFavorites()
            }
        } catch {
            print(error)
        }
//        self.musicService!.toggleFavorite(music: musicService!.getAllMusics()[0], isFavorite: true)
//        self.musicService!.toggleFavorite(music: musicService!.getAllMusics()[1], isFavorite: true)
//        self.musicService!.toggleFavorite(music: musicService!.getAllMusics()[2], isFavorite: true)
        
        favTable.dataSource = self
        favTable.delegate = self
    }
    
    //MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentMus = mus[section]
        
        return mus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        //Custom cell
        let hospital = mus[indexPath.section]
        let indiv = mus[indexPath.row]
        
        //1 - Retrieve
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavorCell", for: indexPath) as! FavoritesCell
        
        //2- Configure cell
        cell.coverImage.image = musicService?.getCoverImage(forItemIded: indiv.id)
        cell.nameLabel.text = indiv.title
        cell.artistLabel.text = indiv.artist
        
        
        //3 return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentMusic = mus[section]
        return nil
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goSongs", sender: self.mus[indexPath.row])
    }
    
    
    //MARK: - Segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetails" {
//            let destination = segue.destination as! CharacterDetailsViewController
//
//            guard let filme = sender as? Movie else { return }
//
//            destination.movie = filme
//        }
//    }
}
