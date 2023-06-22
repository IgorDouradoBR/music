//
//  SearchTableViewCell.swift
//  Music
//
//  Created by Lucas Cunha on 20/06/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var figure: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    var musician: MusicCollection?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.figure.layer.cornerRadius = 20
        // Initialization code
    }
    
    func configure(category: MusicCollection){
        name.text = musician?.mainPerson
        
        do {
            var service = try MusicService()
            figure.image = service.getCoverImage(forItemIded: musician?.id ?? "")
        } catch {
            
        }
        
        
    }
}
