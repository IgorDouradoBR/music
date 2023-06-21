//
//  LibraryTableViewCell.swift
//  Music
//
//  Created by Lucas Cunha on 20/06/23.
//

import UIKit

class LibraryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var icon: UIImageView!
    
    var category: MusicCollectionType?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(category: MusicCollectionType){
        name.text = category.description
        icon.image = UIImage(systemName: category.icon)
    }
}
