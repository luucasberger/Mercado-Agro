//
//  OffersTableViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 11/26/20.
//

import UIKit

class OffersTableViewCell: UITableViewCell {
    static let identifier = "OffersTableViewCell"
    let unscrollableRecord: Int = 1000
    var offerImages = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OffersCollectionViewCell.nib(), forCellWithReuseIdentifier: OffersCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 25.0
        flowLayout.itemSize = CGSize(width: 300, height: 150)
        //        flowLayout.sectionInset.left = 60
        //        flowLayout.sectionInset.bottom = 0
        //        flowLayout.sectionInset.right = 50
        //        flowLayout.sectionInset.top = 0
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        customizedOffersTableViewCell()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: OffersTableViewCell.identifier, bundle: nil)
    }
    
    func configure(with images: [String]) {
        self.offerImages = images
        collectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func customizedOffersTableViewCell() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        collectionView.backgroundColor = .clear
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension OffersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /*
     // Carousel effect in 'collectionView'.
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unscrollableRecord
    }
    
    /*
     // offerImages[indexPath.row % offerImages.count]: Specific formula implemented for the 'Carousel Effect',
     so that when the 'indexPath' of the collectionView exceeds the number of items inside 'offerImages' doesn't
     crash the app by accessing non-existing data.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OffersCollectionViewCell.identifier, for: indexPath) as! OffersCollectionViewCell
        cell.configure(with: offerImages[indexPath.row % offerImages.count])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 63, bottom: 0, right: 5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 150)
    }
}
