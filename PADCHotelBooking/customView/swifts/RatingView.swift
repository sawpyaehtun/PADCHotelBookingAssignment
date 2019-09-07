//
//  LabelView.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 05/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit


class RatingView: UIView {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var viewCard: CardView!
    
    var id : Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization() {
        let view = Bundle.main.loadNibNamed(String(describing: RatingView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func didSelectedOrNot(isSelected : Bool) {
        viewCard.layer.borderColor = isSelected ? UIColor.MyTheme.purple.cgColor : UIColor.MyTheme.lightGray.cgColor
        imgStar.tintColor = isSelected ? UIColor.white : UIColor.MyTheme.lightGray
        lblNumber.textColor = imgStar.tintColor
        viewCard.backgroundColor = isSelected ? UIColor.MyTheme.purple : UIColor.white
    }

}
