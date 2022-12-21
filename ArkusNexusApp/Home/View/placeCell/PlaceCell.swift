//
//  PlaceCell.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 18/12/22.
//

import UIKit
import Cosmos

class PlaceCell: UITableViewCell {
    
    //MARK: - Outlets
    //Image
    @IBOutlet weak var placeImage:UIImageView!
    @IBOutlet weak var petImage:UIImageView!
    //Label
    @IBOutlet weak var placeName:UILabel!
    @IBOutlet weak var placeAddress:UILabel!
    @IBOutlet weak var placeDistance:UILabel!
    //RatingView
    @IBOutlet weak var ratingView:CosmosView!

    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        func fillView(placeDetails:PlaceDataModel){
            self.petImage.image = UIImage(named: K.Icons.petFriendly)
            self.placeName.text = placeDetails.PlaceName
            self.placeAddress.text = placeDetails.Address
            self.placeDistance.text = "1.0 m"
            self.ratingView.rating = Double(placeDetails.Rating ?? 0.5)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
