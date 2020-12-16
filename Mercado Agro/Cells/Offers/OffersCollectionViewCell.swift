//
//  OffersCollectionViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 11/26/20.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var offerImage: UIImageView!
    static let identifier = "OffersCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        offerImage.layer.cornerRadius = 15.0
    }
    
    static func nib() -> UINib {
        return UINib(nibName: OffersCollectionViewCell.identifier, bundle: nil)
    }

    /*
     // Add's selected images to the OffersCollectionViewCell.
     // Process: Selected images come originally from 'HomeScreen.swift', then they are
     managed by OffersTableViewCell when creating the UICollectionViewCell, and finally
     inserted by OffersCollectionViewCell.
     */
    public func configure(with image: String) {
        offerImage.image = UIImage(named: image)
    }

}
