//
//  FilterTableViewCell.swift
//  PADCHotelBooking
//
//  Created by saw pyaehtun on 06/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var viewLocation: SearchDataView!
    @IBOutlet weak var viewCheckIn: SearchDataView!
    @IBOutlet weak var viewCheckOut: SearchDataView!
    @IBOutlet weak var viewCount: SearchDataView!
    @IBOutlet weak var viewRoom: SearchDataView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.isUserInteractionEnabled = true
        setUpUIs()
    }

    private func setUpUIs(){
        viewLocation.imgNavigation.isHidden = false
        let searchDataViewArray = [viewLocation,viewCheckIn,viewCheckOut,viewCount,viewRoom]
        for i in 0 ..< searchDataViewArray.count {
            searchDataViewArray[i]?.id = i
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
