//
//  ForCollectionViewTableViewCell.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class ForCollectionViewTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelCollectionView: UICollectionView!
    
    @IBOutlet weak var lblTitle: UILabel!
    var title : String = "" {
        didSet{
            lblTitle.text = title
        }
    }
    
    let numberOfItemsInRow : CGFloat = 1.2
    let spacing : CGFloat = 10
    let leadingSpace : CGFloat = 5
    let TrailingSpace : CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        setUpUIs()
    }
    
    private func setUpUIs(){
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        
//        hotelCollectionView.frame.size.height = UIScreen.main.bounds.width / 2
        hotelCollectionView.delegate = self
        hotelCollectionView.dataSource = self
        hotelCollectionView.registerForCell(strID: String(describing: HotelCollectionViewCell.self))
    
        let layout = hotelCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        // calculating total padding
//        let totalPadding : CGFloat = ((numberOfItemsInRow - 1) * spacing) + leadingSpace + TrailingSpace
//        let itemWidth = (self.frame.width - totalPadding) / numberOfItemsInRow
        
        layout.itemSize = CGSize(width: 350, height: 245)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension ForCollectionViewTableViewCell : UICollectionViewDelegate {
    
}

extension ForCollectionViewTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HotelCollectionViewCell.self), for: indexPath) as! HotelCollectionViewCell
        return item
    }
    
    
    
}
