//
//  HotelCollectionViewCell.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class HotelCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgHotel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUIs()
    }
    
    private func setUpUIs(){
        imgHotel.layer.cornerRadius = 15
    }

}
