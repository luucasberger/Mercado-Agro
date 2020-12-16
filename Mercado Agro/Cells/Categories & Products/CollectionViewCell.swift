//
//  CollectionViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 10/29/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var labelsUIView: UIView!
    @IBOutlet weak var productPriceUIView: UIView!
    @IBOutlet weak var productUIImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productUIImageView.layer.cornerRadius = 10.0
        
        productPriceUIView.layer.cornerRadius = 10.0
        productPriceUIView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        self.backgroundColor = .clear
        
        labelsUIView.layer.cornerRadius = 10.0
        labelsUIView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        productNameLabel.textColor = .black
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CollectionViewCell.identifier, bundle: nil)
    }
    
    /*
     // Manages the data sent by TableViewCell.
     */
    public func configure(with model: ModelP) {
        self.productNameLabel.text = model.text
        self.productPriceLabel.text = model.price
        self.productUIImageView.image = UIImage(named: model.imageName)
    }

}
