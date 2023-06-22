import UIKit

class FavoritesCell: UITableViewCell {

    
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.coverImage.layer.cornerRadius = 12
    }
}
