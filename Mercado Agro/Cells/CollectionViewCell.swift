//
//  CollectionViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/29/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelsUIView: UIView!
    @IBOutlet weak var productUIImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    public func configure(with model: ModelP) {
        self.backgroundColor = .clear
        self.labelsUIView.backgroundColor = .white
        self.productNameLabel.text = model.text
        self.productPriceLabel.text = model.price
        self.productUIImageView.image = UIImage(named: model.imageName)
        self.productUIImageView.layer.cornerRadius = 10.0
        
    }

}
