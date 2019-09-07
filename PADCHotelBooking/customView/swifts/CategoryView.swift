//
//  CategoryView.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class CategoryView: UIView {

    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imgSelectedIndecator: UIImageView!
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
        let view = Bundle.main.loadNibNamed(String(describing: CategoryView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func didSelectedOrNot(isSelected : Bool) {
        
        imgSelectedIndecator.isHidden = !isSelected
        lblCategory.textColor = isSelected ? UIColor.black : UIColor.MyTheme.lightGray

    }

    
}
