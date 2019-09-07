//
//  HotelTableViewCell.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    @IBOutlet weak var imgHotel: UIImageView!
    @IBOutlet weak var imgPoint: UIImageView!
    @IBOutlet weak var imgBookMark: UIImageView!
    
    var hotelImage: UIImage? {
        didSet {
            imgHotel.image = hotelImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        setUpUI()
    }
    
    private func setUpUI(){
        imgHotel.layer.cornerRadius = 10
        imgPoint.tintColor = UIColor.lightGray
        imgBookMark.tintColor = UIColor.white
        
        let tapGestureRecongniser = UITapGestureRecognizer(target: self, action: #selector(didSelectedImgBookMark))
        imgBookMark.isUserInteractionEnabled = true
        imgBookMark.addGestureRecognizer(tapGestureRecongniser)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func didSelectedImgBookMark(){
        if imgBookMark.tintColor == UIColor.white {
            imgBookMark.tintColor = UIColor.MyTheme.purple
        } else {
            imgBookMark.tintColor = UIColor.white
        }
    }
}
