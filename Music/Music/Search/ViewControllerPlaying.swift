//
//  ViewControllerPlaying.swift
//  Music
//
//  Created by Lucas Cunha on 22/06/23.
//

import UIKit

class ViewControllerPlaying: UIViewController {
    
    @IBOutlet weak var musicPlaying: UILabel!
    
    @IBOutlet weak var figure: UIImageView!
    
    @IBOutlet weak var artist: UILabel!
    
    @IBOutlet weak var timeStamp: UILabel!
    
    var musician: MusicCollection?
    var music: Music?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func configure(category: MusicCollection){
            musicPlaying.text = music?.title
            artist.text = music?.artist
            timeStamp.text = "-" + (music?.length.description ?? "2.09")
            do {
                var service = try MusicService()
                figure.image = service.getCoverImage(forItemIded: musician?.id ?? "")
            } catch {
                
            }
            
            
        }
        
    }
}
