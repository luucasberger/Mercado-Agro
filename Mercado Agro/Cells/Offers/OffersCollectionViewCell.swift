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
    
    public func configure(with image: String) {
        offerImage.image = UIImage(named: image)
    }

}
